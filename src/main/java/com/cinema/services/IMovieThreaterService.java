package com.cinema.services;

import java.util.List;

import com.cinema.dto.request.DateOrder;
import com.cinema.dto.request.MTShowDTO;
import com.cinema.dto.request.MovieThreaterDTO;

public interface IMovieThreaterService {
	MovieThreaterDTO save(MovieThreaterDTO dto);
	MTShowDTO showMovieThreater(DateOrder model);
	List<MovieThreaterDTO> listMovieThreater(long idFilm);
}
