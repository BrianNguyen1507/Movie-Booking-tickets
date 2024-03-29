package com.cinema.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "movie_threater")
public class MovieThreaterEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;
	@Column(name = "seat")
	private int seat[][];
	@Column(name = "time")
	private Date time;
	@Column(name = "number_threater")
	private int numberThreater;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "film_id", nullable = false)
    private FilmEntity film;
	
	@OneToMany(mappedBy = "movieThreater", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	private List<TicketEntity> tickets = new ArrayList<>();
	
	
	public MovieThreaterEntity() {
		super();
	}
	public MovieThreaterEntity(long id, int seat[][], Date time,int numberThreater) {
		super();
		this.id = id;
		this.seat = seat;
		this.time = time;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int[][] getSeat() {
		return seat;
	}
	public void setSeat(int row, int column) {
		setSeatDefault(row, column);
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public FilmEntity getFilm() {
		return film;
	}
	public void setFilm(FilmEntity film) {
		this.film = film;
	}
	public int getNumberThreater() {
		return numberThreater;
	}
	public void setNumberThreater(int numberThreater) {
		this.numberThreater = numberThreater;
	}
	public List<TicketEntity> getTickets() {
		return tickets;
	}
	public void setTickets(List<TicketEntity> tickets) {
		this.tickets = tickets;
	}
	private void setSeatDefault(int row, int column) {
		seat = new int[row][row];
		for(int i=0;i<row;i++) {
			for(int j=0;j<column;j++) {
				seat[i][j]=0;
			}
		}
	}
	public boolean setSeatOrder(int seatOrder) {
		int row = seatOrder/10;
		int column = seatOrder%10;
		if(seat[row][column]==0) {
			seat[row][column]=1;
			return true;
		}
		return false;
	}
	
}
