package com.cinema.dto.request;

import lombok.Data;

@Data
public class MovieThreaterDTO {
	
	private int column;
	private int row;
	private String time;
	private int numberThreater;
    private long film;

}
