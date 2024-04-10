package com.cinema.converter;

import com.cinema.dto.reponse.FilmNameResponse;
import com.cinema.dto.reponse.MovieThreaterResponse;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import com.cinema.dto.request.MovieThreaterDTO;
import com.cinema.entity.MovieThreaterEntity;
import com.cinema.util.DateFormatter;

import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class MovieThreaterConverter {
	private FilmConverter filmConverter;

	public MovieThreaterDTO toDTO(MovieThreaterEntity entity) {
		MovieThreaterDTO dto = new MovieThreaterDTO();
		dto.setId(entity.getId());
		dto.setRow(entity.getSeat().length);
		dto.setColumn(entity.getSeat().length);
		dto.setNumberThreater(entity.getNumberThreater());
		dto.setTime(DateFormatter.toStringDateTime(entity.getTime()));
		dto.setFilm(entity.getFilm().getId());
		return dto;
	}
	public MovieThreaterEntity toEntity(MovieThreaterDTO dto) {
		MovieThreaterEntity entity = new MovieThreaterEntity();
		entity.setId(dto.getId());
		entity.setSeat(dto.getRow(),dto.getColumn());
		entity.setNumberThreater(dto.getNumberThreater());
		entity.setTime(DateFormatter.parseTime(dto.getTime()));
		return entity;
	}
	public MovieThreaterResponse toResponse(MovieThreaterEntity entity){
		MovieThreaterResponse response = new MovieThreaterResponse();
		response.setSeat(entity.getSeat());
		response.setFilm(new FilmNameResponse(entity.getFilm().getId(),entity.getFilm().getTitle()));
		response.setNumberThreater(entity.getNumberThreater());
		response.setTime(DateFormatter.toStringDateTime(entity.getTime()));
		return response;
	}
	public List<MovieThreaterResponse> toListResponse(List<MovieThreaterEntity> entities){
		return  entities.stream().map(this::toResponse).collect(Collectors.toList());
	}
}
