package com.cinema.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cinema.dto.FilmDTO;
import com.cinema.entity.CategoryEntity;
import com.cinema.entity.FilmEntity;

public interface FilmRepository extends JpaRepository<FilmEntity, Long> {
	@Query(value="SELECT f FROM FilmEntity f WHERE f.releaseDate BETWEEN ?1 AND ?2 ")
	List<FilmEntity> findAllByReleasDate(Date dateStart, Date dateEnd);

	FilmEntity getReferenceById(long id);
}
