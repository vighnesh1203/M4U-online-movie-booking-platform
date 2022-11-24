package com.movie.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie.model.Seat;

public interface SeatDao extends JpaRepository<Seat,Integer>{
List<Seat> findBySeatNo(int seatNo);
}
