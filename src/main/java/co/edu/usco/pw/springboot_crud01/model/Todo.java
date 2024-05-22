package co.edu.usco.pw.springboot_crud01.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Clientes")
public class Todo {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	private String usuario;

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	private int cantidadVehiculos;
	
	@OneToMany(mappedBy = "todo", fetch = FetchType.LAZY)
	private List<Vehiculos> vehiculos;
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getCantidadVehiculos() {
		return cantidadVehiculos;
	}

	public void setCantidadVehiculos(int cantidadVehiculos) {
		this.cantidadVehiculos = cantidadVehiculos;
	}

	public List<Vehiculos> getVehiculos() {
		return vehiculos;
	}

	public void setVehiculos(List<Vehiculos> vehiculos) {
		this.vehiculos = vehiculos;
	}

	public Todo(int cantidadVehiculos, List<Vehiculos> vehiculos) {
		super();
		this.cantidadVehiculos = cantidadVehiculos;
		this.vehiculos = vehiculos;
	}


	public Todo() {
		// TODO Auto-generated constructor stub
	}

	
	
	

	}