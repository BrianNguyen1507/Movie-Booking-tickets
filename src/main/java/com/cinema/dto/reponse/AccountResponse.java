package com.cinema.dto.reponse;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


public class AccountResponse {
	private long id;
	private String user_name;
	private String password;
	private String role;

	public AccountResponse() {
	}

	public AccountResponse(long id, String user_name, String password, String role) {
		this.id = id;
		this.user_name = user_name;
		this.password = password;
		this.role = role;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
