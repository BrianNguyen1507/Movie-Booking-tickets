package com.cinema.dto.request;


import com.cinema.dto.reponse.AccountResponse;
import lombok.Data;

@Data
public class CustomerDTO {
	private String name;
	private String phoneNumber;
	private String level;
	private String gender;
	private String address;
	private AccountDTO account;
}
