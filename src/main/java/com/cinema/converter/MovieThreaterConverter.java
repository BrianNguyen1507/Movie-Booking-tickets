package com.cinema.converter;

import org.springframework.stereotype.Component;

import com.cinema.dto.MovieThreaterDTO;
import com.cinema.entity.MovieThreaterEntity;
import com.cinema.util.DateFormatter;

@Component
public class MovieThreaterConverter {

	public MovieThreaterDTO toDTO(MovieThreaterEntity entity) {
		MovieThreaterDTO dto = new MovieThreaterDTO();
		
		dto.setRow(entity.getSeat().length);
		dto.setColumn(entity.getSeat().length);
		dto.setNumberThreater(entity.getNumberThreater());
		dto.setTime(DateFormatter.toStringDateTime(entity.getTime()));
		dto.setFilm(entity.getFilm().getId());
		return dto;
	}
	public MovieThreaterEntity toEntity(MovieThreaterDTO dto) {
		MovieThreaterEntity entity = new MovieThreaterEntity();
		entity.setSeat(dto.getRow(),dto.getColumn());
		entity.setNumberThreater(dto.getNumberThreater());
		entity.setTime(DateFormatter.parseTime(dto.getTime()));
		return entity;
	}
}
