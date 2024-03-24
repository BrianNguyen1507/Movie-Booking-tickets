package com.cinema.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cinema.dto.CustomerDTO;
import com.cinema.entity.CustomerEntity;

@Component
public class CustomerConverter {
	
	@Autowired
	AccountConverter accountConverter;
	
	public CustomerDTO toDTO(CustomerEntity entity) {
		CustomerDTO dto = new CustomerDTO();
		
		dto.setName(entity.getName());
		dto.setLevel(entity.getLevel());
		dto.setPhoneNumber(entity.getPhoneNumber());
		dto.setGender(entity.getGender());
		dto.setAddress(entity.getAddress());
		dto.setAccount(accountConverter.toDTO(entity.getAccount()));
		return dto;
	}
	
	public CustomerEntity toEntity(CustomerDTO dto) {
		CustomerEntity entity = new CustomerEntity();
		
		entity.setName(dto.getName());
		entity.setLevel(dto.getLevel());
		entity.setPhoneNumber(dto.getPhoneNumber());
		entity.setGender(dto.getGender());
		entity.setAddress(dto.getAddress());
		return entity;
	}
}
