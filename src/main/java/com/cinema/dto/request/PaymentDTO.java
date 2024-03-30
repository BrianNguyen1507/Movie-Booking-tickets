package com.cinema.dto.request;

import lombok.Data;

@Data
public class PaymentDTO {
	private long accountId;
	private String datetime;
	private int seat[];
	private int sumtotal;
	private String paymentMethod;
	private int quantityTicket;
	private int numberThreater;
	private String dateMovieThreater;
}
