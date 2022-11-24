package com.movie.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie.model.Admin;

public interface AdminDao extends JpaRepository<Admin,String> {

}
