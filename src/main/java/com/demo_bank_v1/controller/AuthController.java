package com.demo_bank_v1.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo_bank_v1.helper.Token;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repositories.UserRepository;

@Controller
public class AuthController {
	
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("/login")
	public ModelAndView getLoginPage() {
		ModelAndView view = new ModelAndView("login");
		String token = Token.generateToken();

		//send token to view
		view.addObject("token", token);
		view.addObject("PageTitle","Login");
		return view;
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("email")String email, 
						@RequestParam("password")String password, 
						@RequestParam("_token")String token, 
						Model model,
						HttpSession session) {
		
		
		// VALIDATE INPUT FIELDS / FORM DATA
		if(email == null || email.isEmpty() || password == null || password.isEmpty()) {
			model.addAttribute("error", "Username or Password cannot be empty");
			return "login";
		}

		// CHECK IF EMAIL EXISTS
		String emailFromDB = userRepository.checkEmail(email);
			
		// CHECK IF VALUE IS NOT NULL
		if(emailFromDB != null) {
			String passwordFromDB = userRepository.checkPassword(email);
			//VALIDATE PASSWORD
			if(!BCrypt.checkpw(password, passwordFromDB)) {
				model.addAttribute("error", "Incorrect Username or Password");
				return "login";
			}
		} else {
			model.addAttribute("error", "Ops! Something went Wrong");
			return "error";
		}
		
		// CHECK IF USER ACCOUNT IS VERIFIED
		int isVerified = userRepository.isVerified(email);
		if(isVerified!=1) {
			model.addAttribute("error", "Account is Not Yet Verified. Please check your email and verify your account");
			return "login";
		}
		
		// PROCEED TO LOG THE USER IN
		User user = userRepository.getUserDetails(email);
		
		session.setAttribute("user", user);
		session.setAttribute("token", token);
		session.setAttribute("authenticated", true);
		
		return "redirect:/app/dashboard";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
		session.invalidate();
		redirectAttributes.addFlashAttribute("log_out", "Successfully Logged Out");
		
		return "redirect:/login";
	}
}
