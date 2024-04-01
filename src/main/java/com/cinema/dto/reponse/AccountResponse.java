package com.cinema.dto.reponse;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class AccountResponse {
	private long id;
	private String user_name;
	private String password;
	private String role;
}
