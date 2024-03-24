package com.cinema.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.entity.TicketEntity;

public interface TicketRepository extends JpaRepository<TicketEntity, Long> {
	
}
