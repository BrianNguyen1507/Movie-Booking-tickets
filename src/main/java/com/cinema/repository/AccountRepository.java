package com.cinema.repository;

import java.util.List;

import com.cinema.entity.EmployeesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.entity.AccountEntity;

public interface AccountRepository extends JpaRepository<AccountEntity, Long> {
	AccountEntity findOneByUserName(String username);
	AccountEntity findByUserName(String username);

}
