package com.cinema.services;

import com.cinema.dto.reponse.AccountResponse;
import com.cinema.dto.request.AccountDTO;
import com.cinema.entity.AccountEntity;

public interface IAccountService {
	AccountEntity checkAccount(AccountDTO accountDTO);
	boolean checkDuplicate(String userName);
}
