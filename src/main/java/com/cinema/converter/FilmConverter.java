package com.cinema.converter;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cinema.dto.FilmDTO;
import com.cinema.entity.FilmEntity;
import com.cinema.util.DateFormatter;


@Component
public class FilmConverter {
	
	@Autowired
	private CategoryConverter categoryConverter;
	
	public String byteToString(byte[] bdata){
		String str = new String(bdata);
		return str;
	}
	
	public FilmEntity toEntity(FilmDTO filmDTO) throws ParseException {
		FilmEntity entity = new FilmEntity();
		entity.setId(filmDTO.getId());	
		entity.setTitle(filmDTO.getTitle());
		entity.setLength(filmDTO.getLength());
		entity.setReleaseDate(DateFormatter.parse(filmDTO.getReleaseDate()));
		entity.setActor(filmDTO.getActor());
		entity.setDirector(filmDTO.getDirector());
		entity.setDescribe(filmDTO.getDescribe());
		entity.setPosters(filmDTO.getPosters());
		entity.setPrice(filmDTO.getPrice());
		entity.setCategories(categoryConverter.tolistEntities(filmDTO.getCategories()));
		return entity;
	}
	public FilmDTO toDTO(FilmEntity filmEntity){
		FilmDTO filmDTO = new FilmDTO();
		filmDTO.setId(filmEntity.getId());
		filmDTO.setTitle(filmEntity.getTitle());
		filmDTO.setLength(filmEntity.getLength());
		filmDTO.setReleaseDate(DateFormatter.toSStringDate(filmEntity.getReleaseDate()));
		filmDTO.setActor(filmEntity.getActor());
		filmDTO.setDirector(filmEntity.getDirector());
		filmDTO.setDescribe(filmEntity.getDescribe());
		filmDTO.setPosters(filmEntity.getPosters());
		filmDTO.setPrice(filmEntity.getPrice());
		filmDTO.setCategories(categoryConverter.tolistDTO(filmEntity.getCategories()));
		return filmDTO;
	}
	public List<FilmDTO> toListDTO(List<FilmEntity> entities){
		List<FilmDTO> dtos = new ArrayList<FilmDTO>();
		for(FilmEntity entity : entities) {
			FilmDTO dto = toDTO(entity);
			dtos.add(dto);
		}
		return dtos;
	}
}
