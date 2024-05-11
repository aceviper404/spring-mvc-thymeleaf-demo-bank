package com.demo_bank_v1.repositories;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo_bank_v1.models.Account;

@Repository
public interface AccountRepository extends CrudRepository<Account, Integer>{
	
	@Query(value="SELECT * FROM accounts WHERE user_id= :user_id", nativeQuery = true) 
	List<Account> getUserAccountById(@Param("user_id")int user_id);
	
	@Query(value="SELECT SUM(balance) FROM accounts WHERE user_id= :user_id", nativeQuery = true)
	BigDecimal getTotalBalance(@Param("user_id")int user_id);
	
	@Query(value="SELECT balance FROM accounts WHERE account_id= :account_id AND user_id= :user_id", nativeQuery = true)
	BigDecimal getCurrentBalance(@Param("account_id")int accountId, @Param("user_id")int user_id);
	
	@Modifying
	@Query(value="UPDATE accounts SET balance= :balance, updated_at=NOW() WHERE account_id= :account_id ", nativeQuery = true)
	@Transactional
	void updateCurrentBalance(@Param("balance")BigDecimal balance, 
							  @Param("account_id")int accountId);
	
	@Modifying
	@Query(value="INSERT INTO accounts (user_id, account_number, account_name, account_type, created_at)"
			+ " VALUES(:user_id, :account_number, :account_name, :account_type, NOW())", nativeQuery = true)
	@Transactional
	void createAccount(@Param("user_id")int user_id,
					   @Param("account_number")int account_number,
					   @Param("account_name")String account_name,
					   @Param("account_type")String account_type);
	
	
}