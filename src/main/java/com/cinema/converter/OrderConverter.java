package com.cinema.converter;

import org.springframework.stereotype.Component;

import com.cinema.dto.request.OrderDTO;
import com.cinema.dto.request.PaymentDTO;
import com.cinema.entity.OrderEntity;
import com.cinema.util.DateFormatter;

@Component
public class OrderConverter {

	public OrderEntity PaymentDTOtoEntity(PaymentDTO dto) {
		OrderEntity entity = new OrderEntity();
		entity.setQuantityTicket(dto.getQuantityTicket());
		entity.setPaymentMethod(dto.getPaymentMethod());
		entity.setSumtotal(dto.getSumtotal());
		entity.setDate(DateFormatter.parseTime(dto.getDatetime()));
		return entity;
	}
	public PaymentDTO EntitytoPaymentDTO(OrderEntity entity) {
		PaymentDTO dto = new PaymentDTO();
		dto.setQuantityTicket(entity.getQuantityTicket());;
		dto.setPaymentMethod(entity.getPaymentMethod());
		dto.setSumtotal(entity.getSumtotal());
		dto.setDatetime(DateFormatter.toStringDateTime(entity.getDate()));
		return dto;
	}
	public OrderDTO toDTO(OrderEntity entity) {
		OrderDTO dto = new OrderDTO();
		dto.setId(entity.getId());
		dto.setDate(DateFormatter.toStringDateTime(entity.getDate()));
		dto.setQuantityTicket(entity.getQuantityTicket());
		dto.setPaymentMethod(entity.getPaymentMethod());
		dto.setSumtotal(entity.getSumtotal());
		return dto;
	}
}
