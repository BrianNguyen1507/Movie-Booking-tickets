package com.cinema.api;

import com.cinema.dto.reponse.AccountResponse;
import com.cinema.dto.reponse.AuthenticationResponse;
import com.cinema.dto.request.AccountDTO;
import com.cinema.services.impl.AccountService;
import com.cinema.services.impl.AuthenticationService;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController 
@RequestMapping("/cinema")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class AccountAPI {

    AccountService accountService;

    AuthenticationService authenticationService;

    @PostMapping(value = "/login")
    public AuthenticationResponse checkAccount(@RequestBody AccountDTO request) {
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String role = authentication.getAuthorities().toString();
        return authenticationService.authenticate(request);
    }
}
