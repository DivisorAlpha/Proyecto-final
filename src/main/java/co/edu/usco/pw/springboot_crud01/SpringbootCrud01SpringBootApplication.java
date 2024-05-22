package co.edu.usco.pw.springboot_crud01;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = {"co.edu.usco.pw.springboot_crud01.model"})
public class SpringbootCrud01SpringBootApplication{

	
	public static void main(String[] args) {
		SpringApplication.run(SpringbootCrud01SpringBootApplication.class, args);
	}

}
