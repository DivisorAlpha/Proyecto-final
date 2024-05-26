package co.edu.usco.pw.springboot_crud01.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.edu.usco.pw.springboot_crud01.model.Todo;
import co.edu.usco.pw.springboot_crud01.repository.TodoRepository;

@Service
public class TodoService implements ITodoService {

	@Autowired
	private TodoRepository todoRepository;

	@Override
	public List<Todo> getTodosByUser(String user) {
		return todoRepository.findByUserName(user);
	}
	
	public Optional<Todo> getTodoById(long id) {
		return todoRepository.findById(id);
	}
	
	@Override
    public Todo getTodoById1(long id) {
        return todoRepository.findById(id).orElse(null);
    }

	@Override
	public void updateTodo(Todo todo) {
		todoRepository.save(todo);
	}

	@Override
	public void addTodo(String name, String desc, Date targetDate, boolean isDone) {
		todoRepository.save(new Todo(name, desc, targetDate, isDone));
	}
	
	
	
	@Override
	public void deleteTodo(long id) {
		Optional<Todo> todo = todoRepository.findById(id);
		if (todo.isPresent()) {
			todoRepository.delete(todo.get());
		}
	}

	@Override
	public void saveTodo(Todo todo) {
		todoRepository.save(todo);
	}
	
	public void setVehicleType(long todoId, String tipoVehiculo) {
	    Todo todo = todoRepository.findById(todoId).orElseThrow();
	    switch (tipoVehiculo) {
	        case "motocicleta":
	            todo.setMotocicleta(true);
	            todo.setCarro(false);
	            todo.setCarroPesado(false);
	            break;
	        case "carro":
	            todo.setMotocicleta(false);
	            todo.setCarro(true);
	            todo.setCarroPesado(false);
	            break;
	        case "carroPesado":
	            todo.setMotocicleta(false);
	            todo.setCarro(false);
	            todo.setCarroPesado(true);
	            break;
	        default:
	            // Manejar caso no válido
	            break;
	    }
	    todoRepository.save(todo);
	}

	
	
}