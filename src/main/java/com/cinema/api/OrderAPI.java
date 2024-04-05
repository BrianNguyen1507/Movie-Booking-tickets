package com.cinema.api;

import java.util.List;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import com.cinema.dto.request.OrderDTO;
import com.cinema.dto.request.PaymentDTO;
import com.cinema.services.impl.OrderService;

@RestController
@RequestMapping("/cinema")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class OrderAPI {

	OrderService orderService;
	
	@PostMapping(value="/addPayment")
	PaymentDTO createPayment(@RequestBody PaymentDTO model) {
		var authentication = SecurityContextHolder.getContext().getAuthentication();
		String userName = authentication.getName();
		return orderService.createPayment(model,userName);
	}
	
	@GetMapping(value="/getOrder")
	List<OrderDTO> getlistOrderDTO(){
		var authentication = SecurityContextHolder.getContext().getAuthentication();
		String userName = authentication.getName();
		return orderService.getlistOrderDTO(userName);
	}
}
