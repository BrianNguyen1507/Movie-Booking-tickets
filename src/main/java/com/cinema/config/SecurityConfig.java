package com.cinema.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.oauth2.jose.jws.MacAlgorithm;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.web.SecurityFilterChain;

import javax.crypto.spec.SecretKeySpec;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Value("${jwt.signerKey}")
	String signerKey;
	private final String[] PUBLIC_ENDPOINTS = {
			"/cinema/login",
            "/cinema/register",
			"/cinema/detailFilm"
			,"/cinema/showAllFilm"
			,"/cinema/listfeatured"
			,"/cinema/showSeat"
			,"/cinema/showMovieThreater"
			,"/cinema/categories"
			,"/cinema/getAllFilmName"
	};
	private final String[] PRIVATE_ENPOINT_ADMIN ={
			"/cinema/addFilm"
			,"/cinema/updateFilm"
			,"/cinema/deleteFilm"

			,"/cinema/addMovieThreater"
	};
	private final String[] PRIVATE_ENPOINT_USER ={
			"/cinema/addPayment"
			,"/cinema/getOrder"
	};
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception{
		httpSecurity
		.authorizeHttpRequests(request->
		request.requestMatchers(HttpMethod.POST, PUBLIC_ENDPOINTS)
			.permitAll()
			.requestMatchers(HttpMethod.GET, PUBLIC_ENDPOINTS).permitAll()
				.requestMatchers(HttpMethod.POST,PRIVATE_ENPOINT_ADMIN).hasAuthority("SCOPE_ADMIN")
				.requestMatchers(HttpMethod.GET,PRIVATE_ENPOINT_ADMIN).hasAuthority("SCOPE_ADMIN")
				.requestMatchers(HttpMethod.POST,PRIVATE_ENPOINT_USER).hasAuthority("SCOPE_USER")
				.requestMatchers(HttpMethod.GET,PRIVATE_ENPOINT_USER).hasAuthority("SCOPE_USER")
			.anyRequest()
			.authenticated());

		httpSecurity.oauth2ResourceServer(oauth2 ->
				oauth2.jwt(jwtConfigurer -> jwtConfigurer.decoder(jwtDecoder())));
		httpSecurity.csrf(AbstractHttpConfigurer::disable);
		return httpSecurity.build();
	}

	@Bean
	JwtDecoder jwtDecoder(){
		SecretKeySpec secretKey = new SecretKeySpec(signerKey.getBytes(),"HS256");
		return NimbusJwtDecoder
				.withSecretKey(secretKey)
				.macAlgorithm(MacAlgorithm.HS256)
				.build();
	}
}
