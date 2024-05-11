package com.demo_bank_v1.controller;

import java.util.Random;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo_bank_v1.helper.HTML;
import com.demo_bank_v1.helper.Token;
import com.demo_bank_v1.mailMessenger.MailMessenger;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repositories.UserRepository;

@Controller
public class RegisterController {
	
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("/register")
	public ModelAndView getRegistrationPage() {
		ModelAndView view = new ModelAndView("register");
		System.out.println("in registration page controller");
		view.addObject("PageTitle","Register");
		return view;
	}
	
	@PostMapping("/register")
	public ModelAndView register(@Valid @ModelAttribute("registerUser") User user, 
									BindingResult result,
									@RequestParam("first_name") String first_name,
	                                @RequestParam("last_name") String last_name,
	                                @RequestParam("email") String email,
	                                @RequestParam("password") String password,
	                                @RequestParam("confirm_password") String confirm_password
	                                ) throws MessagingException {
		
		ModelAndView view = new ModelAndView("register");
		
		//check for errors
		if(result.hasErrors() && confirm_password.isEmpty()){
			view.addObject("confirm_password", "The Confirm Field is required");
			return view;
		}
		
		// check for password match
		if(!password.equals(confirm_password)) {
			view.addObject("passwordMismatch","passwords do not match");
			return view;
		}
		
		// get token string
		String token = Token.generateToken();
		
		// generate random code
		Random random = new Random();
		int bound = 345;
		int code = bound * random.nextInt(bound);
		
		// get email html body
		String emailBody =  HTML.HTMLEmailTemplate(token, Integer.toString(code));
		
		// hash password
		String hashed_password = BCrypt.hashpw(password, BCrypt.gensalt());
		
		// register user
		userRepository.registerUser(first_name, last_name, email, hashed_password, token, Integer.toString(code));
		
		// send email notification
		MailMessenger.htmlEmailMessenger("no-reply@demomailtrap.com", email, "Verify Account", emailBody);
		
		// return to register page
		view.addObject("success", "Account Registered Successfully. Please Check your email and Verify Account");
		
		return view;
	}
}
