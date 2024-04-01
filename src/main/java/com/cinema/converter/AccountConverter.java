package com.cinema.converter;

import com.cinema.dto.reponse.AccountResponse;
import org.springframework.stereotype.Component;

import com.cinema.dto.request.AccountDTO;
import com.cinema.entity.AccountEntity;

@Component
public class AccountConverter {
	
	public AccountDTO toDTO(AccountEntity entity) {
		AccountDTO dto = new AccountDTO();
		dto.setUser_name(entity.getUserName());
		dto.setPassword(entity.getPassword());
		dto.setRole(entity.getRole());
		return dto;
	}
	public AccountEntity toEntity(AccountDTO dto) {
		AccountEntity entity = new AccountEntity();
		entity.setUserName(dto.getUser_name());
		entity.setPassword(dto.getPassword());
		entity.setRole(dto.getRole());
		return entity;
	}

}
