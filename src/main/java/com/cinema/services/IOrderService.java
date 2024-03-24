package com.cinema.services;

import java.util.List;

import com.cinema.dto.OrderDTO;
import com.cinema.dto.PaymentDTO;

public interface IOrderService {
	PaymentDTO createPayment(PaymentDTO model);
	List<OrderDTO> getlistOrderDTO(long accountId);
}
