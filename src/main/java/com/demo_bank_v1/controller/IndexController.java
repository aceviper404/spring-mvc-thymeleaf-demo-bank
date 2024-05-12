package com.demo_bank_v1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo_bank_v1.repositories.UserRepository;

@Controller
public class IndexController {
	
	@Autowired
	private UserRepository userRepository;

	@GetMapping("/")
	public ModelAndView getIndex() {
		ModelAndView view = new ModelAndView("index");
		System.out.println("in index controller");
		view.addObject("PageTitle","Home");
		return view;
	}

	@GetMapping("/error")
	public ModelAndView getErrorPage() {
		ModelAndView view = new ModelAndView("error");
		System.out.println("in error page controller");
		view.addObject("PageTitle","error");
		return view;
	}
	
	@GetMapping("/verify")
	public ModelAndView verifyPage(@RequestParam("token") String token, @RequestParam("code") String code) {
		ModelAndView view;
		
		// check if token is valid
		String tokenFromDB= userRepository.checkToken(token);
		
		if(tokenFromDB==null) {
			view = new ModelAndView("error");
			view.addObject("error", "This Session has Expired");
			return view;
		}
		userRepository.verifyAccount(token, code);
		System.out.println("in verify page controller");
		view = new ModelAndView("login");
		view.addObject("success", "Account Verified Successfully. Please Proceed to Login");
		return view;
	}
}
