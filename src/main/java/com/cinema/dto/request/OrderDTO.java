package com.cinema.dto.request;

import lombok.Data;

@Data
public class OrderDTO {
	private long id;
	private String date;
	private int quantityTicket;
	private String paymentMethod;
	private int sumtotal;
	

}
