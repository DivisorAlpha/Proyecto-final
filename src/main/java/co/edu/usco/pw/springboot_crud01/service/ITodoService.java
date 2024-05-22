package co.edu.usco.pw.springboot_crud01.service;

import java.util.List;
import java.util.Optional;
import co.edu.usco.pw.springboot_crud01.model.Todo;
import co.edu.usco.pw.springboot_crud01.model.Vehiculos;

public interface ITodoService {

	List<Todo> getTodosByUser(String user);

	Optional<Todo> getTodoById(long id);

	void updateTodo(Todo todo);

	void deleteTodo(long id);
	
	void saveTodo(Todo todo);
	
	void addtodo(int cantidadVehiculos, List<Vehiculos> vehiculos);

}