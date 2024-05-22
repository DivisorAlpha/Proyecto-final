package co.edu.usco.pw.springboot_crud01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Logincontroller {
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
}