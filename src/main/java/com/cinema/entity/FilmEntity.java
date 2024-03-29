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
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;


@Entity
@Table(name = "film")
public class FilmEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;
	@Column(name = "title")
	private String title;
	@Column(name = "length")
	private String length;
	@Column(name = "release_date")
	private Date releaseDate;
	@Column(name = "actor")
	private String actor;
	@Column(name = "director")
	private String director;
	@Column(name = "description")
	private byte[] description;
	@Column(name = "posters")
	private byte[] posters;
	@Column(name="basic_price")
	private double price;

	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "film_category",
      joinColumns = @JoinColumn(name = "film_id"),
      inverseJoinColumns = @JoinColumn(name = "category_id")
    )
	private List<CategoryEntity> categories = new ArrayList<>();
	
	@OneToMany(mappedBy = "film", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	private List<MovieThreaterEntity> movieThreaters = new ArrayList<>();

	
	public FilmEntity() {
		
	}
	
	public FilmEntity(long id, String title, String length, Date releaseDate, String actor, String director,
			byte[] describe, byte[] posters,double price) {
		super();
		this.id = id;
		this.title = title;
		this.length = length;
		this.releaseDate = releaseDate;
		this.actor = actor;
		this.director = director;
		this.description = describe;
		this.posters = posters;
		this.price = price;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public byte[] getDescribe() {
		return description;
	}

	public void setDescribe(byte[] describe) {	
		this.description = describe;
	}

	public byte[] getPosters() {
		return posters;
	}

	public void setPosters(byte[] posters) {
		this.posters = posters;
	}
	

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public List<CategoryEntity> getCategories() {
		return categories;
	}

	public void setCategories(List<CategoryEntity> categories) {
		this.categories = categories;
	}

	public List<MovieThreaterEntity> getMovieThreaters() {
		return movieThreaters;
	}

	public void setMovieThreaters(List<MovieThreaterEntity> movieThreaters) {
		this.movieThreaters = movieThreaters;
	}


	
}
