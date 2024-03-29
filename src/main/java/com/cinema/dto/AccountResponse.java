package com.cinema.dto;

public class AccountResponse {
	private long id;
	private String user_name;
	private String password;
	private int role;
	private String token;
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
	
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public AccountResponse() {
		super();
	}
	public AccountResponse( String user_name, String password ,long id,int role) {
		super();
		this.id = id;
		this.user_name = user_name;
		this.password = password;
		this.role = role;
	}
	
}
