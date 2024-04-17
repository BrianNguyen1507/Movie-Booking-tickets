package com.cinema.services.impl;

import java.util.ArrayList;
import java.util.List;

import com.cinema.dto.reponse.MovieThreaterResponse;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
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
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class MovieThreaterService implements IMovieThreaterService {


    FilmRepository filmRepository;

    MovieThreaterRepository movieThreaterRepository;

    MovieThreaterConverter movieThreaterConverter;

    @Override
    public MovieThreaterDTO save(MovieThreaterDTO model) {
        FilmEntity filmEntity = filmRepository.findById(model.getFilm()).orElse(null);
        MovieThreaterEntity entity = movieThreaterRepository
                .findOneByTimeAndNumberThreater(DateFormatter.parsedMyTime(model.getTime()), model.getNumberThreater());
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
                .findOneByTimeAndNumberThreater(DateFormatter.parsedMyTime(model.getDate()), model.getNumberThreater());
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

    @Override
    public MovieThreaterDTO update(MovieThreaterDTO dto) {
        MovieThreaterEntity entity = movieThreaterRepository.getReferenceById(dto.getId());

//        entity.setSeat(dto.getRow(), dto.getColumn());
//        entity.setNumberThreater(dto.getNumberThreater());
//        entity.setTime(DateFormatter.parseYMDTime(dto.getTime()));
        entity = movieThreaterConverter.toEntity(dto);
        FilmEntity filmEntity = filmRepository.findById(dto.getFilm()).orElse(null);
        entity.setFilm(filmEntity);
        movieThreaterRepository.save(entity);
        return dto;
    }

    @Override
    public boolean delete(long id) {
        MovieThreaterEntity entity = movieThreaterRepository.findById(id).orElse(null);
        assert entity != null :"MovieThreaterEntity is null";
        movieThreaterRepository.delete(entity);
        return true;
    }

    @Override
    public List<MovieThreaterResponse> getAllMovieThreater() {
        List<MovieThreaterEntity> entities = movieThreaterRepository.findAll();

        return movieThreaterConverter.toListResponse(entities);
    }

    @Override
    public MovieThreaterResponse detail(long id) {
        MovieThreaterEntity entity = movieThreaterRepository.findById(id).orElse(null);
        if(entity!=null){
            return movieThreaterConverter.toResponse(entity);
        }
        return null;
    }

}
