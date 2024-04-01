package com.cinema.services;

import com.cinema.dto.reponse.CustomerResponse;
import com.cinema.dto.request.CustomerDTO;

public interface ICustomerService {
	CustomerResponse save(CustomerDTO customerDTO);
}
