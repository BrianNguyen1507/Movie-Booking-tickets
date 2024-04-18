package com.cinema.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.entity.OrderEntity;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<OrderEntity, Long> {
	List<OrderEntity> findAllByCustomerId(long id);

	List<OrderEntity> findAllByDate(Date date);

	@Query(value="SELECT sum (o.sumtotal) " +
			"FROM OrderEntity o " +
			"WHERE YEAR(o.date) = ?1 AND MONTH (o.date) = ?2 AND DAY (o.date) = ?3")
	String sumTotalByDay(int year, int month, int day);

	@Query(value="SELECT sum (o.sumtotal) " +
			"FROM OrderEntity o " +
			"WHERE YEAR(o.date) = ?1 AND MONTH (o.date) = ?2 ")
	String sumTotalByMonth(int year, int month);
}
