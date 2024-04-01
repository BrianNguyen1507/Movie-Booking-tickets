package com.cinema.api;

import com.cinema.dto.reponse.CustomerResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cinema.dto.request.CustomerDTO;
import com.cinema.services.impl.CustomerService;

@RestController
@RequestMapping("/cinema")
public class CustomerAPI {

	@Autowired
	CustomerService customerService;
	
	@PostMapping(value = "/register")
	public CustomerResponse createCustomer(@RequestBody CustomerDTO model) {
		return customerService.save(model);
	}
	
}
