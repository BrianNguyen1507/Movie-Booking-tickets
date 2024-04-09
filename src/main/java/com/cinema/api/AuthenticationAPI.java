package com.cinema.api;

import com.cinema.dto.reponse.IntrospectResponse;
import com.cinema.dto.request.IntrospectRequest;
import com.cinema.services.impl.AuthenticationService;
import com.nimbusds.jose.JOSEException;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;

@RestController
@RequestMapping("/cinema")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class AuthenticationAPI {
    AuthenticationService authenticationService;

    @PostMapping("/introspect")
    IntrospectResponse introspect(@RequestBody IntrospectRequest request) throws ParseException, JOSEException {
        return  authenticationService.introspect(request);
    }
}
