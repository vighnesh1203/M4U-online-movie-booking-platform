package com.movie.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie.model.Movie;
import com.movie.model.Show;
import com.movie.model.Theatre;

public interface ShowDao extends JpaRepository<Show, String>{

List<Show> findByMovie(Movie movie);
List<Show> findByTheatre(Theatre theatre);
}
