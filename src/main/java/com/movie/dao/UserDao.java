package com.movie.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie.model.User;

public interface UserDao extends JpaRepository<User, String> {
	
	List<User> findByEmailId(String emailId);
//	User findByEmailId(String emailId);
	User findByFirstName(String fName);
}
