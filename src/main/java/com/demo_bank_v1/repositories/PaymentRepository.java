package com.demo_bank_v1.repositories;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo_bank_v1.models.Payment;

@Repository
public interface PaymentRepository extends CrudRepository<Payment, Integer>{

	@Modifying
	@Query(value="INSERT INTO payments (account_id, beneficiary, beneficiary_acc_number, amount, "
			+ "reference_no, status, reason_code, created_at) VALUES(:account_id, :beneficiary, "
			+ ":beneficiary_acc_number, :amount, :reference_no, :status, :reason_code, NOW())", nativeQuery = true)
	@Transactional
	void makePayment(@Param("account_id") int account_id,
		             @Param("beneficiary") String beneficiary,
		             @Param("beneficiary_acc_number") String beneficiary_acc_number,
		             @Param("amount") BigDecimal amount,
		             @Param("reference_no") String reference_no,
		             @Param("status") String status,
		             @Param("reason_code") String reason_code);
}
