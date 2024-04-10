package com.cinema.services;

import java.util.List;

import com.cinema.dto.reponse.MovieThreaterResponse;
import com.cinema.dto.request.DateOrder;
import com.cinema.dto.request.MTShowDTO;
import com.cinema.dto.request.MovieThreaterDTO;

public interface IMovieThreaterService {
	MovieThreaterDTO save(MovieThreaterDTO dto);
	MTShowDTO showMovieThreater(DateOrder model);
	List<MovieThreaterDTO> listMovieThreater(long idFilm);
	MovieThreaterDTO update(MovieThreaterDTO dto);
	boolean delete(long id);

	List<MovieThreaterResponse> getAllMovieThreater();
}
