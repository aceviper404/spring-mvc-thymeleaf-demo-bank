package com.demo_bank_v1.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo_bank_v1.helper.GenerateAccountNumber;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repositories.AccountRepository;

@Controller
@RequestMapping("/account")
public class AccountsController {
	
	@Autowired
	private AccountRepository accountRepository;

	@PostMapping("/create_account")
	public String createAccount(@RequestParam("account_name")String account_name, 
								@RequestParam("account_type")String account_type,
								RedirectAttributes redirectAttributes,
								HttpSession session) {
		
		// check for empty strings
		if(account_name.isEmpty() || account_name.equals("")) {
			redirectAttributes.addFlashAttribute("error", "Account Name cannot be empty");
			return "redirect:/app/dashboard";
		}
		
		// get logged in user
		User user = (User)session.getAttribute("user");
		
		// generate account number
		int accountNumber = GenerateAccountNumber.generateAccountNumber();
		
		// create account
		accountRepository.createAccount(user.getUser_id(), accountNumber, account_name, account_type);
		
		// set success message
		redirectAttributes.addFlashAttribute("success", "Account Created Successfully");
		
		return "redirect:/app/dashboard";
	}
}
