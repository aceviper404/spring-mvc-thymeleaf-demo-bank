package com.demo_bank_v1.models;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Payment {
	@Id
	private int payment_id;
	private int account_id;
	private String beneficiary;
	private String beneficiary_acc_number;
	private BigDecimal amount;
	private String reference_no;
	private String status;
	private String reason_code;
	private LocalDateTime created_at;
	
	
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getBeneficiary() {
		return beneficiary;
	}
	public void setBeneficiary(String beneficiary) {
		this.beneficiary = beneficiary;
	}
	public String getBeneficiary_acc_number() {
		return beneficiary_acc_number;
	}
	public void setBeneficiary_acc_number(String beneficiary_acc_number) {
		this.beneficiary_acc_number = beneficiary_acc_number;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getReference_no() {
		return reference_no;
	}
	public void setReference_no(String reference_no) {
		this.reference_no = reference_no;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReason_code() {
		return reason_code;
	}
	public void setReason_code(String reason_code) {
		this.reason_code = reason_code;
	}
	public LocalDateTime getCreated_at() {
		return created_at;
	}
	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
	}
	
	

}
