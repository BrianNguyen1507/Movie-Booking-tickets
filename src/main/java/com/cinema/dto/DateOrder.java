package com.cinema.dto;

public class DateOrder {

	private String date;
	private int numberThreater;

	public DateOrder() {
		super();
	}

	public DateOrder(String date,int numberThreater) {
		super();
		this.date = date;
		
		this.numberThreater =numberThreater;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getNumberThreater() {
		return numberThreater;
	}

	public void setNumberThreater(int numberThreater) {
		this.numberThreater = numberThreater;
	}
	
	
}
