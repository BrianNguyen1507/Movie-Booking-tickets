package com.cinema.services;

import com.cinema.dto.AccountDTO;

public interface IAccountService {
	AccountDTO checkAccount(AccountDTO accountDTO);
	boolean checkDuplicate(String userName);
}
