package com.cinema.services.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.converter.MovieThreaterConverter;
import com.cinema.dto.request.DateOrder;
import com.cinema.dto.request.MTShowDTO;
import com.cinema.dto.request.MovieThreaterDTO;
import com.cinema.entity.FilmEntity;
import com.cinema.entity.MovieThreaterEntity;
import com.cinema.repository.FilmRepository;
import com.cinema.repository.MovieThreaterRepository;
import com.cinema.services.IMovieThreaterService;
import com.cinema.util.DateFormatter;

@Service
public class MovieThreaterService implements IMovieThreaterService {

    @Autowired
    FilmRepository filmRepository;

    @Autowired
    MovieThreaterRepository movieThreaterRepository;

    @Autowired
    MovieThreaterConverter movieThreaterConverter;

    @Override
    public MovieThreaterDTO save(MovieThreaterDTO model) {
        FilmEntity filmEntity = filmRepository.findById(model.getFilm()).orElse(null);
        MovieThreaterEntity entity = movieThreaterRepository
                .findOneByTimeAndNumberThreater(DateFormatter.parseTime(model.getTime()), model.getNumberThreater());
        if (entity == null) {
            entity = movieThreaterConverter.toEntity(model);
            entity.setFilm(filmEntity);
            entity = movieThreaterRepository.save(entity);
            return movieThreaterConverter.toDTO(entity);
        }
        return null;
    }

    @Override
    public MTShowDTO showMovieThreater(DateOrder model) {
        MTShowDTO dto = new MTShowDTO();
        MovieThreaterEntity movieThreaterEntity = movieThreaterRepository
                .findOneByTimeAndNumberThreater(DateFormatter.parseTime(model.getDate()), model.getNumberThreater());
        FilmEntity filmEntity = movieThreaterEntity.getFilm();
        dto.setSeat(movieThreaterEntity.getSeat());
        dto.setDate(DateFormatter.toStringDateTime(movieThreaterEntity.getTime()));
        dto.setTitle(filmEntity.getTitle());
        dto.setPrice(filmEntity.getPrice());
        return dto;
    }

	@Override
	public List<MovieThreaterDTO> listMovieThreater(long idFilm) {
		List<MovieThreaterDTO> listMT = new ArrayList<MovieThreaterDTO>();
		List<MovieThreaterEntity> movieThreaterEntities = movieThreaterRepository.findAllByFilmId(idFilm);
		for(MovieThreaterEntity entity : movieThreaterEntities) {
			MovieThreaterDTO dto = movieThreaterConverter.toDTO(entity);
			listMT.add(dto);
		}
		return listMT;
	}

}
