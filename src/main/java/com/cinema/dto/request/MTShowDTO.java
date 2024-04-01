package com.cinema.dto.request;

import lombok.Data;

@Data
public class MTShowDTO {
	private String title;
	private String date;
	private int seat[][];
	private double price;
}
