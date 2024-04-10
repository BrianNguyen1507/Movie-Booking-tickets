package com.cinema.api;

import java.util.List;

import com.cinema.dto.reponse.MovieThreaterResponse;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.cinema.dto.request.DateOrder;
import com.cinema.dto.request.MTShowDTO;
import com.cinema.dto.request.MovieThreaterDTO;
import com.cinema.services.impl.MovieThreaterService;

@RestController
@RequestMapping("/cinema")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class MovieThreaterAPI {

	MovieThreaterService movieThreaterService;
	
	@PostMapping(value ="/addMovieThreater")
	public MovieThreaterDTO createMT(@RequestBody MovieThreaterDTO model) {
		return movieThreaterService.save(model);
	}

	@PostMapping(value ="/updateMovieThreater")
	public MovieThreaterDTO updateMT(@RequestBody MovieThreaterDTO model) {
		return movieThreaterService.update(model);
	}

	@GetMapping(value ="/deleteMovieThreater")
	public boolean delete(@RequestParam ("id") long id) {
		return movieThreaterService.delete(id);
	}

	@PostMapping(value = "/showSeat")
	public MTShowDTO showMovieThreater(@RequestBody DateOrder model) {
		return movieThreaterService.showMovieThreater(model);
	}
	
	@GetMapping(value = "/showMovieThreater")
	public List<MovieThreaterDTO> MovieThreaterSelection(@RequestParam("id") long id ) {
		return movieThreaterService.listMovieThreater(id);
	}

	@GetMapping(value = "/getAllMovieThreater")
	public List<MovieThreaterResponse> getAllMovieThreater() {
		return movieThreaterService.getAllMovieThreater();
	}
}
