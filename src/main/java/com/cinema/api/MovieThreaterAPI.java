package com.cinema.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cinema.dto.DateOrder;
import com.cinema.dto.MTShowDTO;
import com.cinema.dto.MovieThreaterDTO;
import com.cinema.services.impl.MovieThreaterService;

@RestController
public class MovieThreaterAPI {

	@Autowired
	MovieThreaterService movieThreaterService;
	
	@PostMapping(value ="/cinema/addMovieThreate")
	public MovieThreaterDTO createMT(@RequestBody MovieThreaterDTO model) {
		return movieThreaterService.save(model);
	}
	
	@PostMapping(value = "/cinema/showMovieThreater")
	public MTShowDTO showMovieThreater(@RequestBody DateOrder model) {
		return movieThreaterService.showMovieThreater(model);
	}
	
	@GetMapping(value = "/cinema/showMovieThreater")
	public List<MovieThreaterDTO> MovieThreaterSelection(@RequestParam("id") long id ) {
		return movieThreaterService.listMovieThreater(id);
	}
}
