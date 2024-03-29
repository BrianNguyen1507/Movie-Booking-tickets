package com.cinema.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cinema.dto.CategoryDTO;
import com.cinema.services.impl.CategoryService;

@RestController
@RequestMapping("/cinema")
public class CategoryAPI {
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping(value="/categories")
	List<CategoryDTO> getcategories(){
		return categoryService.getCategory();
	}
}
