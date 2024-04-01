package com.cinema.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.entity.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, Long> {
	List<OrderEntity> findAllByCustomerId(long id);
}
