package com.demo_bank_v1.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo_bank_v1.models.PaymentHistory;

@Repository
public interface PaymentHistoryRepository extends CrudRepository<PaymentHistory, Integer>{

	@Query(value="SELECT * FROM v_payments", nativeQuery = true)
	List<PaymentHistory> getPaymentHistory();
}
