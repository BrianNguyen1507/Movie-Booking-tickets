package com.cinema.dto.request;


import lombok.Data;

import java.util.List;
@Data
public class FilmDTO {
	
	private long id;
	private String title;
	private String length;
	private String releaseDate;
	private String actor;
	private String director;
	private String describe;
	private byte[] posters;
	private double price;
	private List<CategoryDTO> categories;
}
