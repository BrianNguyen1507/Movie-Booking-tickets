package com.cinema.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.converter.AccountConverter;
import com.cinema.converter.CustomerConverter;
import com.cinema.dto.CustomerDTO;
import com.cinema.entity.AccountEntity;
import com.cinema.entity.CustomerEntity;
import com.cinema.repository.AccountRepository;
import com.cinema.repository.CustomerRepository;
import com.cinema.services.ICustomerService;
import com.cinema.util.EncrpytPassword;

@Service
public class CustomerService implements ICustomerService {
	
	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired 
	AccountConverter accountConverter;
	
	@Autowired 
	CustomerConverter customerConverter;
	
	@Autowired
	AccountService accountService;
	

	@Override
	public CustomerDTO save(CustomerDTO customerDTO) {
		if(accountService.checkDuplicate(customerDTO.getAccount().getUser_name())==false) {
			CustomerEntity customerEntity = new CustomerEntity();
			AccountEntity accountEntity = new AccountEntity();
			customerDTO.getAccount().setPassword(EncrpytPassword.encryptPassword(customerDTO.getAccount().getPassword()));
			accountEntity = accountConverter.toEntity(customerDTO.getAccount());
			accountEntity.setCustomer(customerConverter.toEntity(customerDTO));
			accountEntity = accountRepository.save(accountEntity);
			customerEntity = customerConverter.toEntity(customerDTO);
			customerEntity.setAccount(accountEntity);
			return customerConverter.toDTO(customerEntity);
		}
		return null;
	}



}
