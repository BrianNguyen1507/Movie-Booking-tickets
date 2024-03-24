package com.cinema.services;

import java.util.List;

import com.cinema.dto.DateOrder;
import com.cinema.dto.MTShowDTO;
import com.cinema.dto.MovieThreaterDTO;

public interface IMovieThreaterService {
	MovieThreaterDTO save(MovieThreaterDTO dto);
	MTShowDTO showMovieThreater(DateOrder model);
	List<MovieThreaterDTO> listMovieThreater(long idFilm);
}
