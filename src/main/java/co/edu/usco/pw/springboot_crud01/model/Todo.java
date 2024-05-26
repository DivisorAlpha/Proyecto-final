package co.edu.usco.pw.springboot_crud01.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

@Entity
@Table(name = "Clientes")
public class Todo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String description;
    private String nombre;
    private String userName;
    private Date targetDate;
    private Date salidaVehiculo;
    private String placa;
    private boolean motocicleta; // Nuevo campo para el checkbox
    private boolean carro;
    private boolean carroPesado;
    private double precio;
    private double telefono;
    
   
   
	

	public double getTelefono() {
		return telefono;
	}

	public void setTelefono(double telefono) {
		this.telefono = telefono;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Date getSalidaVehiculo() {
		return salidaVehiculo;
	}

	public void setSalidaVehiculo(Date salidaVehiculo) {
		this.salidaVehiculo = salidaVehiculo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public boolean isCarro() {
		return carro;
	}

	public void setCarro(boolean carro) {
		this.carro = carro;
	}

	public boolean isCarroPesado() {
		return carroPesado;
	}

	public void setCarroPesado(boolean carroPesado) {
		this.carroPesado = carroPesado;
	}

	public boolean isMotocicleta() {
		return motocicleta;
	}

	public void setMotocicleta(boolean motocicleta) {
		this.motocicleta = motocicleta;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public Todo(String name, String desc, Date targetDate2, boolean isDone) {
		// TODO Auto-generated constructor stub
	}

	public Todo() {
		// TODO Auto-generated constructor stub
	}

	@PrePersist
    protected void onCreate() {
        this.targetDate = new Date();
    }

    // Getters y setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getTargetDate() {
        return targetDate;
    }

    public void setTargetDate(Date targetDate) {
        this.targetDate = targetDate;
    }

}
