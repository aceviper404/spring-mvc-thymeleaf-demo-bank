package com.demo_bank_v1.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo_bank_v1.models.TransactHistory;

@Repository
public interface TransactionHistoryRepository extends CrudRepository<TransactHistory, Integer>{

	@Query(value="SELECT * FROM v_transaction_history", nativeQuery = true)
	List<TransactHistory> getTransactionHistory();
}
