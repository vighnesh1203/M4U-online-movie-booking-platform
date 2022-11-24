package com.movie.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;


@Entity
public class Admin {
	@Id
	@NotBlank(message="Admin ID Field should not be Empty")
	private String adminUserId;
	@NotBlank(message="Admin Password Field should not be Empty")
	private String password;
	
	
	public String getAdminUserId() {
		return adminUserId;
	}
	public void setAdminUserId(String adminUserId) {
		this.adminUserId = adminUserId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
