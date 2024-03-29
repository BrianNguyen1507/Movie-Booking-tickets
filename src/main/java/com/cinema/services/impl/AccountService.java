package com.cinema.services.impl;




import java.util.Arrays;
import java.util.List;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.converter.AccountConverter;
import com.cinema.dto.AccountDTO;
import com.cinema.entity.AccountEntity;
import com.cinema.repository.AccountRepository;
import com.cinema.services.IAccountService;
import com.cinema.util.EncrpytPassword;

@Service
public class AccountService implements IAccountService {
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	AccountConverter accountConverter;

	@Override
	public AccountDTO checkAccount(AccountDTO accountDTO) {
		try {
			AccountEntity entity = accountRepository.findOneByUserName(accountDTO.getUser_name());
			String password = EncrpytPassword.encryptPassword(accountDTO.getPassword());
			if(entity.getPassword().equals(password)) {
				accountDTO.setId(entity.getId());
				
				return accountDTO;
			}
				
		}catch(NullPointerException ex) {
			return null;
		}
		return null;
	}
	
	public boolean checkDuplicate(String userName){
		List<AccountEntity> list = accountRepository.findAll();
		for(AccountEntity accountEntity : list) {
			if(userName.equals(accountEntity.getUserName())) {
				return true;
			}
		}
		return false;
	}
}
