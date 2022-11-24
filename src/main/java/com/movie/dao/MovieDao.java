package com.movie.dao;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;

import com.movie.model.Movie;

public interface MovieDao extends JpaRepository<Movie, String>{
//	@Query("from Movie ")
Movie findByMovieName(String name);
Movie deleteByMovieName(String name);
}
