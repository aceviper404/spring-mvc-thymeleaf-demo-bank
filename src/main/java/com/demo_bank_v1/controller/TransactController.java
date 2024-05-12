package com.demo_bank_v1.controller;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repositories.AccountRepository;
import com.demo_bank_v1.repositories.PaymentRepository;
import com.demo_bank_v1.repositories.TransactRepository;

@Controller
@RequestMapping("/transact")
public class TransactController {
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private PaymentRepository paymentRepository;
	
	@Autowired
	private TransactRepository transactRepository;
	
	User user;
	LocalDateTime currentDateTime = LocalDateTime.now();

	@PostMapping("/deposit")
	public String deposit(@RequestParam("deposit_amount")String depositAmount,
						  @RequestParam("account_id")String accountID,
						  HttpSession session,
						  RedirectAttributes attributes) {
				// deposit to another bank	
		
		// check for null values
		if(depositAmount == null || depositAmount.isEmpty() || depositAmount.equals("") || accountID.isEmpty()) {
			attributes.addFlashAttribute("error", "Deposit Amount or Account should not be empty");
			return "redirect:/app/dashboard";
		}
		
		BigDecimal depositAmountInteger = new BigDecimal(depositAmount);

		// get logged in user
		user =(User)session.getAttribute("user");
		
		// get current balance
		int intAccountId = Integer.parseInt(accountID);
		BigDecimal currentBalance = accountRepository.getCurrentBalance(intAccountId, user.getUser_id());
		
		// chck if content is 0
		if(depositAmountInteger.doubleValue() == 0.00) {
			attributes.addFlashAttribute("error", "Deposit Amount can not be 0.00");
			return "redirect:/app/dashboard";
		}
		
		BigDecimal newBalance = currentBalance.add(depositAmountInteger);	
		accountRepository.updateCurrentBalance(newBalance, intAccountId);
		transactRepository.logTransaction(intAccountId, "Deposit", depositAmountInteger, "online", "success", "Deposited Transaction Successful", currentDateTime);
		
		attributes.addFlashAttribute("success", "Amount Deposited Successfully!");
		return "redirect:/app/dashboard";
	}
	
	@PostMapping("/payment")
	public String payment(@RequestParam("beneficiary")String beneficiary,
						  @RequestParam("beneficiary_acc_number")String beneficiaryAccountNumber,
						  @RequestParam("account_id")String accountID,
						  @RequestParam("reference")String reference,
						  @RequestParam("payment_amount")String paymentAmount,
						  HttpSession session,
						  RedirectAttributes redirectAttributes) {
		
		// check for empty or null inputs
		if(beneficiary.isEmpty() || beneficiaryAccountNumber.isEmpty() || accountID.isEmpty() || reference.isEmpty() || paymentAmount == null) {
			redirectAttributes.addFlashAttribute("error", "Beneficiary, Account Number, Account ID, Reference or Payment Amount cannot be empty");
			return "redirect:/app/dashboard";
		}
		
		// convert into integers
		BigDecimal paymentAmountNumber = new BigDecimal(paymentAmount);
		int accountIDInteger = Integer.parseInt(accountID);
		
		// check for 0s
		if(paymentAmountNumber.doubleValue() == 0.00){
			redirectAttributes.addFlashAttribute("error", "Payment Amount cannot be 0");
			return "redirect:/app/dashboard";
		}
		
		// get current user details
		user =(User)session.getAttribute("user");
		
		// check for sufficient funds
		BigDecimal currentbalance = accountRepository.getCurrentBalance(Integer.parseInt(accountID), user.getUser_id());
		if(Double.parseDouble(paymentAmount)>currentbalance.doubleValue()) {
			redirectAttributes.addFlashAttribute("error", "Insufficient Amount");
			String reasonCode = "Payment Failed!";
			paymentRepository.makePayment(accountIDInteger, beneficiary, beneficiaryAccountNumber, 
					paymentAmountNumber, reference, "failed", reasonCode);
			transactRepository.logTransaction(accountIDInteger, "Payment", paymentAmountNumber, "online", "failed", "Insufficient Funds", currentDateTime);
			return "redirect:/app/dashboard";
		}
		
		// update acccount balance
		BigDecimal newBalance = currentbalance.subtract(paymentAmountNumber);
		accountRepository.updateCurrentBalance(newBalance, accountIDInteger);
		
		// make payment
		String reasonCode = "Payment Processed Successfully!";
		paymentRepository.makePayment(accountIDInteger, beneficiary, beneficiaryAccountNumber, 
				paymentAmountNumber, reference, "success", reasonCode);
		transactRepository.logTransaction(accountIDInteger, "Payment", paymentAmountNumber, "online", "success", "Payment Transaction Successful", currentDateTime);
		
		redirectAttributes.addFlashAttribute("success", "Payment Successful!");
		return "redirect:/app/dashboard";
	}
	
	
	@PostMapping("/transfer")
    public String transfer(@RequestParam("transfer_from") String transfer_from,
                           @RequestParam("transfer_to") String transfer_to,
                           @RequestParam("transfer_amount")String transfer_amount,
                           HttpSession session,
                           RedirectAttributes redirectAttributes){
        // Init Error Message Value:
        String errorMessage;

        // TODO: CHECK FOR EMPTY FIELDS:
        if(transfer_from.isEmpty() || transfer_to.isEmpty() || transfer_amount.isEmpty()){
             errorMessage = "The account transferring from and to along with the amount cannot be empty!";
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        // TODO: CONVERT VARIABLES:
        int transferFromId = Integer.parseInt(transfer_from);
        int transferToId = Integer.parseInt(transfer_to);
        BigDecimal transferAmount = new BigDecimal(transfer_amount);

        // TODO: CHECK IF TRANSFERRING INTO THE SAME ACCOUNT:
        if(transferFromId == transferToId){
            errorMessage = "Cannot Transfer Into The same Account, Please select the appropriate account to perform transfer";
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        // TODO: CHECK FOR 0 (ZERO) VALUES:
        if(transferAmount.doubleValue() == 0.0){
            errorMessage = "Cannot Transfer an amount of 0 (Zero) value, please enter a value greater than 0 (Zero) ";
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        // TODO: GET LOGGED IN USER:
        user = (User)session.getAttribute("user");

        // TODO: GET CURRENT BALANCE:
        BigDecimal currentBalanceOfAccountTransferringFrom  = accountRepository.getCurrentBalance(user.getUser_id(), transferFromId);
        
        // TODO: CHECK IF TRANSFER AMOUNT IS MORE THAN CURRENT BALANCE:
        if(currentBalanceOfAccountTransferringFrom.doubleValue()<transferAmount.doubleValue()){
            errorMessage = "You Have insufficient Funds to perform this Transfer!";
            // Log Failed Transaction:
            transactRepository.logTransaction(transferFromId, "Transfer", transferAmount, "online", "failed", "Insufficient Funds", currentDateTime);
            redirectAttributes.addFlashAttribute("error", errorMessage);
            return "redirect:/app/dashboard";
        }

        BigDecimal  currentBalanceOfAccountTransferringTo = accountRepository.getCurrentBalance(user.getUser_id(), transferToId);

        // TODO: SET NEW BALANCE:
        BigDecimal newBalanceOfAccountTransferringFrom = currentBalanceOfAccountTransferringFrom.subtract(transferAmount);
        System.out.println("newBalanceOfAccountTransferringFrom: "+newBalanceOfAccountTransferringFrom);

        BigDecimal newBalanceOfAccountTransferringTo = currentBalanceOfAccountTransferringTo.add(transferAmount);
        System.out.println("newBalanceOfAccountTransferringTo: "+newBalanceOfAccountTransferringTo);

        // Changed The Balance Of the Account Transferring From:
        accountRepository.updateCurrentBalance( newBalanceOfAccountTransferringFrom, transferFromId);

        // Changed The Balance Of the Account Transferring To:
        accountRepository.updateCurrentBalance(newBalanceOfAccountTransferringTo, transferToId);

        // Log Successful Transaction:
        transactRepository.logTransaction(transferFromId, "Transfer", transferAmount, "online", "success", "Transfer Transaction Successful",currentDateTime);

        String successMessage = "Amount Transferred Successfully!";
        redirectAttributes.addFlashAttribute("success", successMessage);
        return "redirect:/app/dashboard";
    }
	
	@PostMapping("/withdraw")
	public String withdraw(@RequestParam("withdrawal_amount")String withdrawalAmount,
						  @RequestParam("account_id")String accountID,
						  HttpSession session,
						  RedirectAttributes attributes) {
				// deposit to another bank	
		
		// check for null values
		if(withdrawalAmount == null || withdrawalAmount.isEmpty() || withdrawalAmount.equals("") || accountID.isEmpty()) {
			attributes.addFlashAttribute("error", "Deposit Amount or Account should not be empty");
			return "redirect:/app/dashboard";
		}
		
		BigDecimal withdrawalAmountInteger = new BigDecimal(withdrawalAmount);

		// get logged in user
		user =(User)session.getAttribute("user");
		
		// get current balance
		int intAccountId = Integer.parseInt(accountID);
		BigDecimal currentBalance = accountRepository.getCurrentBalance(intAccountId, user.getUser_id());
		
		// chck if content is 0
		if(withdrawalAmountInteger.doubleValue() == 0.00) {
			attributes.addFlashAttribute("error", "Deposit Amount can not be 0.00");
			return "redirect:/app/dashboard";
		}
		
		// check for sufficient balance
		if(withdrawalAmountInteger.doubleValue()> currentBalance.doubleValue()) {
			attributes.addFlashAttribute("error", "Insufficient Amount!");
			transactRepository.logTransaction(intAccountId, "Withdraw", withdrawalAmountInteger, "online", "failed", "Insufficient Funds", currentDateTime);
			return "redirect:/app/dashboard";
		}
		
		BigDecimal newBalance = currentBalance.subtract(withdrawalAmountInteger);
		accountRepository.updateCurrentBalance(newBalance, intAccountId);
		transactRepository.logTransaction(intAccountId, "Withdraw", withdrawalAmountInteger, "online", "success", "Withdraw Transaction Successful", currentDateTime);
		
		attributes.addFlashAttribute("success", "Amount Withdrawn Successfully!");
		return "redirect:/app/dashboard";
	}
	
	
}
