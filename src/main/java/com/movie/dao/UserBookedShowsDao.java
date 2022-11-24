package com.movie.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie.model.UserBookedShows;

public interface UserBookedShowsDao extends JpaRepository<UserBookedShows, Integer>{

}
