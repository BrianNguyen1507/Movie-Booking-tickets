package com.cinema.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cinema.dto.AccountDTO;
import com.cinema.services.impl.AccountService;

@RestController 
public class AccountAPI {

    @Autowired 
    AccountService accountService;

    @PostMapping(value = "/cinema/login")
    public AccountDTO checkAccount(@RequestBody AccountDTO model) {
        return accountService.checkAccount(model);
    }
}
