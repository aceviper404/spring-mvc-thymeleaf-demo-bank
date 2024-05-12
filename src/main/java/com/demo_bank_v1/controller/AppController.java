package com.demo_bank_v1.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.demo_bank_v1.models.Account;
import com.demo_bank_v1.models.PaymentHistory;
import com.demo_bank_v1.models.TransactHistory;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repositories.AccountRepository;
import com.demo_bank_v1.repositories.PaymentHistoryRepository;
import com.demo_bank_v1.repositories.TransactionHistoryRepository;

@Controller
@RequestMapping("/app")
public class AppController {
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private PaymentHistoryRepository paymentHistoryRepository;
	
	@Autowired
	private TransactionHistoryRepository transactionHistoryRepository;
	
	@GetMapping("/dashboard")
	public ModelAndView getDashboard(HttpSession session) {
		ModelAndView view = new ModelAndView("dashboard");
		User user = (User)session.getAttribute("user");
		
		List<Account> accounts = accountRepository.getUserAccountById(user.getUser_id());
		BigDecimal balance = accountRepository.getTotalBalance(user.getUser_id());

		view.addObject("user", user);
		view.addObject("accounts", accounts);
		view.addObject("balance", balance);
		return view;
	}
	
	@GetMapping("/payment_history")
	public ModelAndView getPaymentHistory() {
		ModelAndView view = new ModelAndView("payment_history");
		//User user = (User)session.getAttribute("user");
		
		// get the payment history view
		List<PaymentHistory> paymentHistorylist = paymentHistoryRepository.getPaymentHistory();
		
//		List<Account> accounts = accountRepository.getUserAccountById(user.getUser_id());
//		BigDecimal balance = accountRepository.getTotalBalance(user.getUser_id());

		view.addObject("paymentHistorylist", paymentHistorylist);
//		view.addObject("accounts", accounts);
//		view.addObject("balance", balance);
		return view;
	}
	
	@GetMapping("/transaction_history")
	public ModelAndView getTransactionHistory() {
		ModelAndView view = new ModelAndView("transaction_history");
		
		// get the payment history view
		List<TransactHistory> transactHistorylist = transactionHistoryRepository.getTransactionHistory();
		
		view.addObject("transactHistorylist", transactHistorylist);

		return view;
	}

}
