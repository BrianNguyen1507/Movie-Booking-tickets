package com.cinema.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.converter.CategoryConverter;
import com.cinema.dto.request.CategoryDTO;
import com.cinema.entity.CategoryEntity;
import com.cinema.repository.CategoryRepository;
import com.cinema.services.ICategory;

@Service
public class CategoryService implements ICategory {

	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	CategoryConverter categoryConverter;
	
	@Override
	public List<CategoryDTO> getCategory() {
		List<CategoryEntity> entities = categoryRepository.findAll();
		return categoryConverter.tolistDTO(entities) ;
	}

}
