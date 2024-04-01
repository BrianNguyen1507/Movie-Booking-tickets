package com.cinema.services.impl;




import java.util.List;

import com.cinema.dto.reponse.AccountResponse;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cinema.converter.AccountConverter;
import com.cinema.dto.request.AccountDTO;
import com.cinema.entity.AccountEntity;
import com.cinema.repository.AccountRepository;
import com.cinema.services.IAccountService;
import com.cinema.util.EncrpytPassword;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AccountService implements IAccountService {

	@NonFinal
	@Value("${jwt.signerKey}")
	protected String SIGNER_KEY;


	AccountRepository accountRepository;

	AccountConverter accountConverter;


	@Override
	public AccountEntity checkAccount(AccountDTO accountDTO) {
		AccountResponse accountResponse = new AccountResponse();
		try {
			AccountEntity entity = accountRepository.findOneByUserName(accountDTO.getUser_name());
			String password = EncrpytPassword.encryptPassword(accountDTO.getPassword());
			if(entity.getPassword().equals(password)) {
				return entity;
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
