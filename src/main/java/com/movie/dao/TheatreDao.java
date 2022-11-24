package com.movie.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie.model.Theatre;

public interface TheatreDao extends JpaRepository<Theatre, String> {
//List<Theatre> findByTheatreName(String tName);
	Theatre findByTheatreName(String theatreName);

}
