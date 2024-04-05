package com.cinema.converter;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cinema.dto.request.FilmDTO;
import com.cinema.entity.FilmEntity;
import com.cinema.util.DateFormatter;


@Component
public class FilmConverter {
	
	@Autowired
	private CategoryConverter categoryConverter;
	
	public String byteToString(byte[] bytes){
		Base64.Decoder decoder = Base64.getDecoder();
		String encodedString = new String(bytes);
		byte[] decodedBytes = decoder.decode(encodedString);
		return	new String(decodedBytes) ;
	}
	
	public FilmEntity toEntity(FilmDTO filmDTO) throws ParseException {
		FilmEntity entity = new FilmEntity();
		entity.setId(filmDTO.getId());	
		entity.setTitle(filmDTO.getTitle());
		entity.setLength(filmDTO.getLength());
		entity.setReleaseDate(DateFormatter.parse(filmDTO.getReleaseDate()));
		entity.setActor(filmDTO.getActor());
		entity.setDirector(filmDTO.getDirector());
		entity.setDescribe(filmDTO.getDescribe().getBytes());
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
		filmDTO.setDescribe(byteToString(filmEntity.getDescribe()));
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
