package com.cinema.services.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
public class FilmService implements IFilmService{
	
	@Autowired
	private FilmRepository filmRepository;
	
	@Autowired
	private FilmConverter filmConverter;
	
	@Autowired
	private CategoryConverter categoryConverter;
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public List<FilmDTO> findAllDTOByReleaseDate( ReleaseDateFilm model) {
		List<FilmDTO> resuls = new ArrayList<>();
		List<FilmEntity> entities;
		try {
			entities = filmRepository.findAllByReleasDate(DateFormatter.parse(model.getDateStart()),DateFormatter.parse(model.getDateEnd()));
			for(FilmEntity entity : entities) {
				List<CategoryEntity> categories = categoryRepository.findAllByFilmEntityId(entity.getId());
				List<CategoryDTO> categoriesDTO = new ArrayList<CategoryDTO>();
				for(CategoryEntity categoryEntity : categories) {
					categoriesDTO.add(categoryConverter.toDTO(categoryEntity));
				}
				FilmDTO filmDto = filmConverter.toDTO(entity);
				filmDto.setCategories(categoriesDTO);
				resuls.add(filmDto);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		FilmDTO dto = filmConverter.toDTO(entity);
		dto.setCategories(categoryConverter.tolistDTO(categoryEntities));
		return dto;
	}
	@Override
	public FilmDTO addFilm(FilmDTO filmDTO) {
		FilmEntity entity = new FilmEntity();
		try {
			entity = filmConverter.toEntity(filmDTO);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		entity.setCategories(categoryConverter.tolistEntities(filmDTO.getCategories()));
		FilmDTO dto = filmConverter.toDTO(filmRepository.save(entity));
		dto.setCategories(filmDTO.getCategories());
		return dto;
	}
	@Override
	public FilmDTO updateFilm(FilmDTO filmDTO) {
		FilmEntity entity = filmRepository.getReferenceById(filmDTO.getId());
		entity.setActor(filmDTO.getActor());
		entity.setDescribe(filmDTO.getDescribe().getBytes());
		entity.setLength(filmDTO.getLength());
		entity.setPosters(filmDTO.getPosters());
		entity.setPrice(filmDTO.getPrice());
		entity.setDirector(filmDTO.getDirector());
		entity.setCategories(categoryConverter.tolistEntities(filmDTO.getCategories()));
		try {
			entity.setReleaseDate(DateFormatter.parse(filmDTO.getReleaseDate()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		entity.setTitle(filmDTO.getTitle());
		return filmConverter.toDTO(filmRepository.save(entity));
	}
	@Override
	public boolean deleteFilm(long id) {
		FilmEntity entity = filmRepository.findById(id).orElse(null);
		try {
			filmRepository.delete(entity);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public List<FilmDTO> getAllFilm() {
		List<FilmEntity> films = filmRepository.findAll();
		return filmConverter.toListDTO(films);
	}
}
