package com.cinema.dto;


public class CustomerDTO {
	private String name;
	private String phoneNumber;
	private String level;
	private String gender;
	private String address;
	private AccountDTO account;
	public CustomerDTO() {
		super();
	}
	public CustomerDTO(String name, String phoneNumber, String level, String gender, String address,AccountDTO account) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.account =account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public AccountDTO getAccount() {
		return account;
	}
	public void setAccount(AccountDTO account) {
		this.account = account;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
}
