package com.cinema.converter;

import org.springframework.stereotype.Component;

import com.cinema.dto.AccountDTO;
import com.cinema.entity.AccountEntity;

@Component
public class AccountConverter {
	
	public AccountDTO toDTO(AccountEntity entity) {
		AccountDTO dto = new AccountDTO();
		dto.setUser_name(entity.getUserName());
		dto.setPassword(entity.getPassword());
		return dto;
	}
	public AccountEntity toEntity(AccountDTO dto) {
		AccountEntity entity = new AccountEntity();
		entity.setUserName(dto.getUser_name());
		entity.setPassword(dto.getPassword());
		return entity;
	}

}
