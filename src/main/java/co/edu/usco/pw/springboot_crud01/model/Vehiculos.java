package co.edu.usco.pw.springboot_crud01.model;

import java.time.LocalTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "vehiculos")
public class Vehiculos {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	private String placa;
	
	private LocalTime horaEntrada;
	
	private LocalTime horaSalida;
	
	private int precio;
    // Otros atributos y métodos de la entidad Vehiculo

	@ManyToOne
	@JoinColumn(name="todo_id")
    private Todo todo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public LocalTime getHoraEntrada() {
		return horaEntrada;
	}

	public void setHoraEntrada(LocalTime horaEntrada) {
		this.horaEntrada = horaEntrada;
	}

	public LocalTime getHoraSalida() {
		return horaSalida;
	}

	public void setHoraSalida(LocalTime horaSalida) {
		this.horaSalida = horaSalida;
	}

	public int getPrecio() {
		return precio;
	}

	public void setPrecio(int precio) {
		this.precio = precio;
	}

	public Todo getTodo() {
		return todo;
	}

	public void setTodo(Todo todo) {
		this.todo = todo;
	}

	public Vehiculos(String placa, LocalTime horaEntrada, LocalTime horaSalida, int precio, Todo todo) {
		super();
		this.placa = placa;
		this.horaEntrada = horaEntrada;
		this.horaSalida = horaSalida;
		this.precio = precio;
		this.todo = todo;
	} 
	
}
