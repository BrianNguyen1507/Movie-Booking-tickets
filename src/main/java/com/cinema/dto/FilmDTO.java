package com.cinema.dto;


import java.util.List;

public class FilmDTO {
	
	private long id;
	private String title;
	private String length;
	private String releaseDate;
	private String actor;
	private String director;
	private byte[] describe;
	private byte[] posters;
	private double price;
	private List<CategoryDTO> categories;
	
	public FilmDTO() {
		
	}
	public FilmDTO(long id, String title, String length, String releaseDate, String actor, String director,
			byte[] describe,byte[] posters,List<CategoryDTO> categories,double price) {
		super();
		this.id = id;
		this.title = title;
		this.length = length;
		this.releaseDate = releaseDate;
		this.actor = actor;
		this.director = director;
		this.describe = describe;
		this.posters = posters;
		this.categories = categories;
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
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
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
		return describe;
	}
	public void setDescribe(byte[] describe) {
		this.describe = describe;
	}
	public byte[] getPosters() {
		return posters;
	}
	public void setPosters(byte[] posters) {
		this.posters = posters;
	}
	
	public List<CategoryDTO> getCategories() {
		return categories;
	}
	public void setCategories(List<CategoryDTO> categories) {
		this.categories = categories;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
}
