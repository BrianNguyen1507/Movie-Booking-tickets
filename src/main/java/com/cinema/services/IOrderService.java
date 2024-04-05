package com.cinema.services;

import java.util.List;

import com.cinema.dto.request.OrderDTO;
import com.cinema.dto.request.PaymentDTO;

public interface IOrderService {
	PaymentDTO createPayment(PaymentDTO model,String userName);
	List<OrderDTO> getlistOrderDTO(String userName);
}
