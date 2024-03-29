package com.cinema.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cinema.entity.MovieThreaterEntity;

public interface MovieThreaterRepository extends JpaRepository<MovieThreaterEntity, Long> {
	
	@Query(value="SELECT m FROM MovieThreaterEntity m WHERE m.time = ?1 AND m.numberThreater = ?2")
	MovieThreaterEntity findOneByTimeAndNumberThreater(Date time, int numberThreater);
	List<MovieThreaterEntity> findAllByFilmId(long id);
}
