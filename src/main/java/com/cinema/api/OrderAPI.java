package com.cinema.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cinema.dto.OrderDTO;
import com.cinema.dto.PaymentDTO;
import com.cinema.services.impl.OrderService;

@RestController
public class OrderAPI {

	@Autowired
	OrderService orderService;
	
	@PostMapping(value="/cinema/addPayment")
	PaymentDTO createPayment(@RequestBody PaymentDTO model) {
		return orderService.createPayment(model);
	}
	
	@GetMapping(value="/cinema/getOrder")
	List<OrderDTO> getlistOrderDTO(@RequestParam("id") long id ){
		return orderService.getlistOrderDTO(id);
	}
}
