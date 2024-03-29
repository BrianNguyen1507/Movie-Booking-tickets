package com.cinema.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cinema.dto.CustomerDTO;
import com.cinema.services.impl.CustomerService;

@RestController
@RequestMapping("/cinema")
public class CustomerAPI {

	@Autowired
	CustomerService customerService;
	
	@PostMapping(value = "/register")
	public CustomerDTO createCustomer(@RequestBody CustomerDTO model) {
		return customerService.save(model);
	}
	
}
