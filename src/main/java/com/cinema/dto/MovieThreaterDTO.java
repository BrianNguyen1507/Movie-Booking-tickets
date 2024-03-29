package com.cinema.dto;


public class MovieThreaterDTO {
	
	private int column;
	private int row;
	private String time;
	private int numberThreater;
    private long film;
	public MovieThreaterDTO() {
		super();
	}
	public MovieThreaterDTO(long id, int column,int row, String time, int numberThreater, long film) {
		super();
		this.column = column;
		this.row = row;
		this.time = time;
		this.numberThreater = numberThreater;
		this.film = film;
	}

	public int getColumn() {
		return column;
	}
	public void setColumn(int column) {
		this.column = column;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getNumberThreater() {
		return numberThreater;
	}
	public void setNumberThreater(int numberThreater) {
		this.numberThreater = numberThreater;
	}
	public long getFilm() {
		return film;
	}
	public void setFilm(long film) {
		this.film = film;
	}
    
    
}
