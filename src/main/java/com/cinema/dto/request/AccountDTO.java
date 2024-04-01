package com.cinema.dto.request;

import lombok.Data;

@Data
public class AccountDTO {
	private long id;
	private String user_name;
	private String password;
	private String role = "USER";
}
