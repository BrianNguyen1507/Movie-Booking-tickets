package com.cinema.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.cinema.dto.request.CategoryDTO;
import com.cinema.entity.CategoryEntity;

@Component
public class CategoryConverter {
	
	public CategoryDTO toDTO(CategoryEntity entity) {
		CategoryDTO dto = new CategoryDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		return dto;
	}
	
	public CategoryEntity toEntity(CategoryDTO dto) {
		CategoryEntity entity = new CategoryEntity();
		entity.setId(dto.getId());
		entity.setName(dto.getName());
		return entity;
	}
	
	public List<CategoryDTO> tolistDTO(List<CategoryEntity> entities) {
		List<CategoryDTO> DTOs = new ArrayList<CategoryDTO>();
		for(CategoryEntity entity : entities) {
			CategoryDTO dto = toDTO(entity);
			DTOs.add(dto);
		}
		return DTOs;
	}
	public List<CategoryEntity> tolistEntities(List<CategoryDTO> dtos) {
		List<CategoryEntity> entities = new ArrayList<CategoryEntity>();
		for(CategoryDTO dto : dtos) {
			CategoryEntity entity = toEntity(dto);
			entities.add(entity);
		}
		return entities;
	}
}
