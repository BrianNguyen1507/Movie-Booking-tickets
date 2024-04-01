package com.cinema.services;

import java.sql.SQLException;
import java.util.List;

import com.cinema.dto.request.FilmDTO;
import com.cinema.dto.request.ReleaseDateFilm;

public interface IFilmService {
	List<FilmDTO> findAllDTOByReleaseDate( ReleaseDateFilm model) throws SQLException ;
	int totalItem();
	FilmDTO detailFilm(long id);
	FilmDTO addFilm(FilmDTO dto);
	FilmDTO updateFilm(FilmDTO dto);
	boolean deleteFilm(long id);
	List<FilmDTO> getAllFilm();
}
