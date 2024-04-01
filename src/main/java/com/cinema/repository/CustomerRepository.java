package com.cinema.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.entity.CustomerEntity;

public interface CustomerRepository extends JpaRepository<CustomerEntity, Long> {
	
}
