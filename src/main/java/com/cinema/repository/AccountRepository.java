package com.cinema.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.entity.AccountEntity;

public interface AccountRepository extends JpaRepository<AccountEntity, Long> {
	AccountEntity findOneByUserName(String username);
	List<AccountEntity> findByUserName(String username);

}
