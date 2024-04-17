package com.cinema.repository;

import com.cinema.entity.TimeSheetsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface TimeSheetsRepository extends JpaRepository<TimeSheetsEntity,Long> {
    @Query(value="SELECT t FROM TimeSheetsEntity t WHERE t.employee.id = ?1 AND YEAR(t.date) = ?2 AND MONTH (t.date) = ?3 AND DAY (t.date) = ?4")
    TimeSheetsEntity checkDuplicateDate(long id, int year,int month, int day);

    @Query(value="SELECT t FROM TimeSheetsEntity t WHERE YEAR(t.date) = ?1 AND MONTH (t.date) = ?2 AND DAY (t.date) = ?3")
    List<TimeSheetsEntity> findAllByDay( int year,int month, int day);
}
