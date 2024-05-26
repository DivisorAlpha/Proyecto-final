package co.edu.usco.pw.springboot_crud01.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
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
        
        model.put("todos", todos);
        
        return "list-todos";
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

	
    @GetMapping("/update-todo")
    public String showUpdateTodoPage(@RequestParam long id, ModelMap model) {
        Todo todo = todoService.getTodoById1(id);
        todo.setSalidaVehiculo(new Date());  // Establecer la fecha y hora de salida
        double precio = calcularPrecio(todo.getTargetDate(), todo.getSalidaVehiculo(), false, false, false);
        todo.setPrecio(precio);
        todoService.saveTodo(todo);  // Guardar la actualización en la base de datos
        model.put("todo", todo);
        return "cobro"; // Cambiar a la página correspondiente
    }

    private double calcularPrecio(Date targetDate, Date salidaVehiculo, boolean motocicleta, boolean carro, boolean carroPesado) {
        long duration = salidaVehiculo.getTime() - targetDate.getTime();
        long diffInHours = TimeUnit.MILLISECONDS.toHours(duration);
        double precioPorHora = 0.0;

        if (motocicleta) {
            precioPorHora = 2000; // Precio por hora para motocicleta
        } else if (carro) {
            precioPorHora = 4000; // Precio por hora para carro
        } else if (carroPesado) {
            precioPorHora = 5000; // Precio por hora para carro pesado
        } else {
            // Manejar el caso en que no se especifica el tipo de vehículo
            // Puedes lanzar una excepción, retornar un valor predeterminado, etc.
        	
        }

        return diffInHours * precioPorHora;
    }




	@PostMapping("/update-todo")
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
	
	@PostMapping("/set-vehicle-type")
	public String setVehicleType(@RequestParam long todoId, @RequestParam String tipoVehiculo) {
	    todoService.setVehicleType(todoId, tipoVehiculo);
	    return "redirect:/list-todos";
	}


	

}
