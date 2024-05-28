package co.edu.usco.pw.springboot_crud01.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.edu.usco.pw.springboot_crud01.model.Todo;
import co.edu.usco.pw.springboot_crud01.service.ITodoService;

@Controller
public class TodoController {

	@Autowired
	private ITodoService todoService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// Date - dd/MM/yyyy
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	
	@GetMapping("/list-todos")
    public String showTodos(ModelMap model) {
        String name = getLoggedInUserName(model);
        List<Todo> todos = todoService.getTodosByUser(name);
        
        // Ordenar la lista por fecha en orden descendente
        todos.sort((todo1, todo2) -> todo2.getTargetDate().compareTo(todo1.getTargetDate()));
        
        // Obtener la autenticación y los roles del usuario
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        model.addAttribute("username", userDetails.getUsername());
        model.addAttribute("roles", auth.getAuthorities());
        
        model.put("todos", todos);
        
        return "list-todos";
    }
	
	@GetMapping("/search")
	public String searchTodos(@RequestParam("search") String search, ModelMap model) {
	    try {
	        List<Todo> todos = todoService.searchTodos(search);
	        model.addAttribute("todos", todos);
	        model.addAttribute("search", search);
	        return "list-todo";
	    } catch (Exception e) {
	        // Manejar la excepción adecuadamente, por ejemplo, registrándola
	        e.printStackTrace();
	        model.addAttribute("error", "Se produjo un error al procesar la solicitud.");
	        return "error"; // Crea una vista "error.jsp" para mostrar el mensaje de error
	    }
	}

	 
	

	private String getLoggedInUserName(ModelMap model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			return ((UserDetails) principal).getUsername();
		}

		return principal.toString();
	}

	@GetMapping("/add-todo")
	public String showAddTodoPage(ModelMap model) {
		model.addAttribute("todo", new Todo());
		return "todo";
	}

	
	@GetMapping("/cobro")
	public String showUpdateTodoPage(@RequestParam long id, ModelMap model) {
	    Todo todo = todoService.getTodoById1(id);
	    todo.setSalidaVehiculo(new Date());  // Establecer la fecha y hora de salida
	    
	    // Determinar el precio por hora basado en el tipo de vehículo
	    double precioHora = obtenerPrecioHora(todo.getTipoVehiculo());
	    
	    // Calcular la diferencia en horas entre la fecha de entrada y la fecha de salida
	    long diferenciaHoras = calcularDiferenciaHoras(todo.getTargetDate(), todo.getSalidaVehiculo());
	    
	    // Calcular el precio total
	    double precio = calcularPrecio(precioHora, diferenciaHoras);
	    todo.setPrecio(precio);
	    
	    todoService.saveTodo(todo);  // Guardar la actualización en la base de datos
	    model.put("todo", todo);
	    return "cobro"; // Cambiar a la página correspondiente
	}

	// Método para obtener el precio por hora basado en el tipo de vehículo
	private double obtenerPrecioHora(String tipoVehiculo) {
	    switch (tipoVehiculo) {
	        case "Carro":
	            return 3000;  // Precio por hora para carro
	        case "Moto":
	            return 1500;   // Precio por hora para moto
	        case "Camion":
	            return 5000;  // Precio por hora para camión
	        default:
	            return 2000;   // Precio por hora para otros tipos de vehículos
	    }
	}

	// Método para calcular la diferencia en horas entre dos fechas
	private long calcularDiferenciaHoras(Date fechaEntrada, Date fechaSalida) {
	    long diffInMillies = Math.abs(fechaSalida.getTime() - fechaEntrada.getTime());
	    return TimeUnit.HOURS.convert(diffInMillies, TimeUnit.MILLISECONDS);
	}

	// Método para calcular el precio total
	private double calcularPrecio(double precioHora, long diferenciaHoras) {
	    return precioHora * diferenciaHoras;
	}



	@PostMapping("/cobro")
    public String processUpdateTodo(@ModelAttribute("todo") Todo todo, ModelMap model) {
        // Procesa la actualización del todo aquí
        return "redirect:/list-todos"; // Redirecciona a la lista de todos después de la actualización
    }

	
	@PostMapping("/add-todo")
	public String addTodo(ModelMap model, @Valid Todo todo, BindingResult result) {

		if (result.hasErrors()) {
			return "todo";
		}

		todo.setUserName(getLoggedInUserName(model));
		todoService.saveTodo(todo);
		return "redirect:/list-todos";
	}

	@GetMapping("/delete-todo")
	public String deleteTodo(@RequestParam long id) {
		todoService.deleteTodo(id);
		// service.deleteTodo(id);
		return "redirect:/list-todos";
	}
	
	

}
