package com.demo_bank_v1.helper;

import java.util.Random;

public class GenerateAccountNumber {
	
	public static int generateAccountNumber() {
		int bounds = 1000;
		
		Random random = new Random();
		int accountNumber = bounds * random.nextInt(bounds);
		
		return accountNumber; 
		
	}

}
