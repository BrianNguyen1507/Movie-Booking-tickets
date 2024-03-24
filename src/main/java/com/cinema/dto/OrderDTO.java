package com.cinema.dto;

public class OrderDTO {
	private long id;
	private String date;
	private int quantityTicket;
	private String paymentMethod;
	private int sumtotal;
	
	public OrderDTO(long id, String date, int quantityTicket, String paymentMethod, int sumtotal) {
		super();
		this.id = id;
		this.date = date;
		this.quantityTicket = quantityTicket;
		this.paymentMethod = paymentMethod;
		this.sumtotal = sumtotal;
	}
	public OrderDTO() {
		super();
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getQuantityTicket() {
		return quantityTicket;
	}
	public void setQuantityTicket(int quantityTicket) {
		this.quantityTicket = quantityTicket;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public int getSumtotal() {
		return sumtotal;
	}
	public void setSumtotal(int sumtotal) {
		this.sumtotal = sumtotal;
	}
	
}
