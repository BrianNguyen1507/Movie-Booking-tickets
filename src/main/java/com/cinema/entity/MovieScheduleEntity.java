package com.cinema.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "movie_schedule")
public class MovieScheduleEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;
	@Column(name = "date")
	private String date;
	
	@ManyToMany(fetch = FetchType.LAZY,mappedBy = "movieSchedules")
	private List<FilmEntity> films = new ArrayList<>();
	
	@OneToMany(mappedBy = "movieSchedule", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	private List<TicketEntity> tickets = new ArrayList<>();
	
	
	public MovieScheduleEntity(long id, String date) {
		super();
		this.id = id;
		this.date = date;
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
	public List<FilmEntity> getFilms() {
		return films;
	}
	public void setFilms(List<FilmEntity> films) {
		this.films = films;
	}
	public List<TicketEntity> getTickets() {
		return tickets;
	}
	public void setTickets(List<TicketEntity> tickets) {
		this.tickets = tickets;
	}
	
	
}
