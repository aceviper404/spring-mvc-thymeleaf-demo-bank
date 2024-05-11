package com.demo_bank_v1.controller_advisor;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.demo_bank_v1.models.User;

@ControllerAdvice
public class AdvisorController {
	
	@ModelAttribute("registerUser")
	public User getUserDefault() {
		return new User(); // this will bind the object to the form fields 
	}
	
	
}
