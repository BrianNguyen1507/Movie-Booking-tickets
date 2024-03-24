package com.cinema.dto;

public class AccountDTO {
	private long id;
	private String user_name;
	private String password;
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
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public AccountDTO() {
		super();
	}
	public AccountDTO( String user_name, String password ,long id) {
		super();
		this.id = id;
		this.user_name = user_name;
		this.password = password;
	}
	
	
}
