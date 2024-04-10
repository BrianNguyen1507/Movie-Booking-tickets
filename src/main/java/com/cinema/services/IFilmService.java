package com.cinema.services;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import com.cinema.dto.reponse.FilmNameResponse;
import com.cinema.dto.request.FilmDTO;
import com.cinema.dto.request.ReleaseDateFilm;

public interface IFilmService {
	List<FilmDTO> findAllDTOByReleaseDate( ReleaseDateFilm model) throws SQLException, ParseException;
	int totalItem();
	FilmDTO detailFilm(long id);
	FilmDTO addFilm(FilmDTO dto) throws ParseException;
	FilmDTO updateFilm(FilmDTO dto) throws ParseException;
	boolean deleteFilm(long id);
	List<FilmDTO> getAllFilm();
	List<FilmNameResponse> getAllFilmName(int step);
}
