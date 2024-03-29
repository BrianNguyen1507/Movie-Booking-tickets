package com.cinema.dto;

public class PaymentDTO {
	private long accountId;
	private String datetime;
	private int seat[];
	private int sumtotal;
	private String paymentMethod;
	private int quantityTicket;
	private int numberThreater;
	private String dateMovieThreater;
	public PaymentDTO() {
		super();
	}
	
	public PaymentDTO(long accountId, String datetime, int seat[], int sumtotal,
			String paymentMethod, int quantityTicket,String dateMovieThreater, int numberThreater) {
		super();
		this.accountId = accountId;
		this.datetime = datetime;
		this.seat=seat;
		this.sumtotal = sumtotal;
		this.paymentMethod = paymentMethod;
		this.quantityTicket = quantityTicket;
		this.numberThreater = numberThreater;
		this.dateMovieThreater = dateMovieThreater;
	}

	public long getAccountId() {
		return accountId;
	}
	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public int[] getSeat() {
		return seat;
	}

	public void setSeat(int[] seat) {
		this.seat = seat;
	}

	public int getSumtotal() {
		return sumtotal;
	}
	public void setSumtotal(int sumtotal) {
		this.sumtotal = sumtotal;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public int getQuantityTicket() {
		return quantityTicket;
	}
	public void setQuantityTicket(int quantityTicket) {
		this.quantityTicket = quantityTicket;
	}



	public int getNumberThreater() {
		return numberThreater;
	}

	public void setNumberThreater(int numberThreater) {
		this.numberThreater = numberThreater;
	}

	public String getDateMovieThreater() {
		return dateMovieThreater;
	}

	public void setDateMovieThreater(String dateMovieThreater) {
		this.dateMovieThreater = dateMovieThreater;
	}
	
}
