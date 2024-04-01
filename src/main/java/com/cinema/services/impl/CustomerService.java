package com.cinema.services.impl;

import com.cinema.dto.reponse.CustomerResponse;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import com.cinema.converter.AccountConverter;
import com.cinema.converter.CustomerConverter;
import com.cinema.dto.request.CustomerDTO;
import com.cinema.entity.AccountEntity;
import com.cinema.entity.CustomerEntity;
import com.cinema.repository.AccountRepository;
import com.cinema.services.ICustomerService;
import com.cinema.util.EncrpytPassword;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CustomerService implements ICustomerService {

	AccountRepository accountRepository;
	

	AccountConverter accountConverter;
	

	CustomerConverter customerConverter;

	AccountService accountService;
	

	@Override
	public CustomerResponse save(CustomerDTO customerDTO) {
		if(!accountService.checkDuplicate(customerDTO.getAccount().getUser_name())) {
			CustomerEntity customerEntity = new CustomerEntity();
			AccountEntity accountEntity = new AccountEntity();
			customerDTO.getAccount().setPassword(EncrpytPassword.encryptPassword(customerDTO.getAccount().getPassword()));
			accountEntity = accountConverter.toEntity(customerDTO.getAccount());
			accountEntity.setCustomer(customerConverter.toEntity(customerDTO));
			accountEntity = accountRepository.save(accountEntity);
			customerEntity = customerConverter.toEntity(customerDTO);
			accountEntity.setPassword("");
			customerEntity.setAccount(accountEntity);
			return customerConverter.toDTO(customerEntity);
		}
		return null;
	}



}
