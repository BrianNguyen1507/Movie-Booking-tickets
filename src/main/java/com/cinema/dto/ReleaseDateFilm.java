package com.cinema.dto;

public class ReleaseDateFilm {

	private String dateStart;
	private String dateEnd;
	public ReleaseDateFilm() {
		super();
	}
	public ReleaseDateFilm(String dateStart, String dateEnd) {
		super();
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
	}
	public String getDateStart() {
		return dateStart;
	}
	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}
	public String getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	
}
