package com.cinema.services.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

import com.cinema.dto.reponse.FilmNameResponse;
import com.cinema.entity.MovieThreaterEntity;
import com.cinema.repository.MovieThreaterRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import com.cinema.converter.CategoryConverter;
import com.cinema.converter.FilmConverter;
import com.cinema.dto.request.CategoryDTO;
import com.cinema.dto.request.FilmDTO;
import com.cinema.dto.request.ReleaseDateFilm;
import com.cinema.entity.CategoryEntity;
import com.cinema.entity.FilmEntity;
import com.cinema.repository.CategoryRepository;
import com.cinema.repository.FilmRepository;
import com.cinema.services.IFilmService;
import com.cinema.util.DateFormatter;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class FilmService implements IFilmService{
	

	private FilmRepository filmRepository;

	private FilmConverter filmConverter;

	private CategoryConverter categoryConverter;

	private CategoryRepository categoryRepository;

	private MovieThreaterRepository movieThreaterRepository;

	@Override
	public List<FilmDTO> findAllDTOByReleaseDate( ReleaseDateFilm model) throws ParseException {
		List<FilmDTO> resuls = new ArrayList<>();
		List<FilmEntity> entities;

			entities = filmRepository.findAllByReleasDate(DateFormatter.parse(model.getDateStart()),DateFormatter.parse(model.getDateEnd()));
			for(FilmEntity entity : entities) {
				List<CategoryEntity> categories = categoryRepository.findAllByFilmEntityId(entity.getId());
				List<CategoryDTO> categoriesDTO = new ArrayList<>();
				for(CategoryEntity categoryEntity : categories) {
					categoriesDTO.add(categoryConverter.toDTO(categoryEntity));
				}
				FilmDTO filmDto = filmConverter.toDTO(entity);
				filmDto.setCategories(categoriesDTO);
				resuls.add(filmDto);
			}

		
		return resuls;
	}
	@Override
	public int totalItem() {
		return (int)filmRepository.count();
	}
	@Override
	public FilmDTO detailFilm(long id) {
		FilmEntity entity = filmRepository.findById(id).orElse(null);
		List<CategoryEntity> categoryEntities = categoryRepository.findAllByFilmEntityId(id);
        assert entity != null : "FilmEntity is null";
        FilmDTO dto = filmConverter.toDTO(entity);
		dto.setCategories(categoryConverter.tolistDTO(categoryEntities));
		return dto;
	}
	@Override
	public FilmDTO addFilm(FilmDTO filmDTO) throws ParseException {
		FilmEntity entity = filmConverter.toEntity(filmDTO);

		entity.setCategories(categoryConverter.tolistEntities(filmDTO.getCategories()));
		FilmDTO dto = filmConverter.toDTO(filmRepository.save(entity));
		dto.setCategories(filmDTO.getCategories());
		return dto;
	}
	@Override
	public FilmDTO updateFilm(FilmDTO filmDTO) throws ParseException {
		FilmEntity entity = filmRepository.getReferenceById(filmDTO.getId());
		entity.setActor(filmDTO.getActor());
		String encodeStr = Base64.getUrlEncoder().encodeToString(filmDTO.getDescribe().getBytes());
		entity.setDescribe(encodeStr.getBytes());
		entity.setLength(filmDTO.getLength());
		entity.setPosters(filmDTO.getPosters());
		entity.setPrice(filmDTO.getPrice());
		entity.setDirector(filmDTO.getDirector());
		entity.setCategories(categoryConverter.tolistEntities(filmDTO.getCategories()));

			entity.setReleaseDate(DateFormatter.parse(filmDTO.getReleaseDate()));

		entity.setTitle(filmDTO.getTitle());
		return filmConverter.toDTO(filmRepository.save(entity));
	}
	@Override
	public boolean deleteFilm(long id) {
		FilmEntity entity = filmRepository.findById(id).orElse(null);
		List<MovieThreaterEntity> movieThreaterEntities = movieThreaterRepository.findAllByFilmId(id);
		movieThreaterEntities.forEach(movieThreaterEntity -> movieThreaterEntity.setFilm(null));
            assert entity != null:"FilmEntity is null";
            filmRepository.delete(entity);
			return true;

	}
	@Override
	public List<FilmDTO> getAllFilm() {
		List<FilmEntity> films = filmRepository.findAll();
		return filmConverter.toListDTO(films);
	}

	@Override
	public List<FilmNameResponse> getAllFilmName(int step) {
		//Find by step
//		Calendar calendar = Calendar.getInstance();
//		calendar.set(Calendar.DAY_OF_YEAR,calendar.get(Calendar.DAY_OF_YEAR)-step);
//		Date dateStart =calendar.getTime();
//		calendar = Calendar.getInstance();
//		calendar.set(Calendar.DAY_OF_YEAR,calendar.get(Calendar.DAY_OF_YEAR)+step);
//		Date dateEnd =calendar.getTime();

		List<FilmEntity> entities = filmRepository.findAll();

        return entities.stream()
				.map(filmEntity -> new FilmNameResponse(filmEntity.getId(), filmEntity.getTitle()))
				.collect(Collectors.toList());
	}
}
