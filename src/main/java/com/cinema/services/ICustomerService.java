package com.cinema.services;

import com.cinema.dto.request.CustomerDTO;

public interface ICustomerService {
	CustomerDTO save(CustomerDTO customerDTO);
}
