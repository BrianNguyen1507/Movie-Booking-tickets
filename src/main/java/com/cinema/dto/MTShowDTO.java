package com.cinema.dto;

public class MTShowDTO {
	private String title;
	private String date;
	private int seat[][];
	private double price;
	public MTShowDTO() {
		super();
	}
	public MTShowDTO(String title, String date, int[][] seat, double price) {
		super();
		this.title = title;
		this.date = date;
		this.seat = seat;
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int[][] getSeat() {
		return seat;
	}
	public void setSeat(int[][] seat) {
		this.seat = seat;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}
