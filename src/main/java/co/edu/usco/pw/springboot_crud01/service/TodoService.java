package co.edu.usco.pw.springboot_crud01.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

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

	
	
	private List<Todo> todos;

    @PostConstruct
    public void init() {
        this.todos = new ArrayList<>();  // Inicializar con una lista vacía o con datos de prueba
        // Añadir algunos datos de ejemplo
        this.todos.add(new Todo(1, "Tarea de ejemplo 1", new Date()));
        this.todos.add(new Todo(2, "Tarea de ejemplo 2", new Date()));
    }

    public List<Todo> getTodos() {
        return todos;
    }

    public List<Todo> searchTodos(String search) {
        return todos.stream()
                .filter(todo -> {
                    String nombre = todo.getNombre();
                    return nombre != null && nombre.toLowerCase().contains(search.toLowerCase());
                })
                .collect(Collectors.toList());
    }

	

	
	
}