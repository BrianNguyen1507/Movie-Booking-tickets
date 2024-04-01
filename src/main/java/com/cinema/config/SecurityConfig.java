package com.cinema.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	private final String[] PUBLIC_ENDPOINTS = {"/cinema/login",
            "/cinema/register"};
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception{
		httpSecurity
		.authorizeHttpRequests(request->
		request.requestMatchers(HttpMethod.POST, "/cinema/**")
			.permitAll()
			.requestMatchers(HttpMethod.GET, "/cinema/**").permitAll()
			.anyRequest()
			.authenticated());
		
		httpSecurity.csrf(csrfCustomizer->csrfCustomizer.disable());
		return httpSecurity.build();
	}
}
