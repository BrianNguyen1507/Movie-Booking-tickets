package com.cinema.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cinema.entity.CategoryEntity;


public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
	@Query(value = "SELECT c FROM CategoryEntity c INNER JOIN  c.films f WHERE f.id = ?1")
	List<CategoryEntity> findAllByFilmEntityId(long filmId);
	
	
}
