package com.movie.model;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.movie.sequenceGenerator.StringPrefixedSequenceIdGenerator;

@Entity
@Table(name = "UserDetails")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "UserSequence")
	@GenericGenerator(name = "UserSequence", strategy = "com.movie.sequenceGenerator.StringPrefixedSequenceIdGenerator", parameters = {
			@Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
			@Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "U_"),
			@Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%02d") })
	private String id;
	
	@Column(nullable = false)
	@NotBlank(message="first name should not be blank")
	@Size(min = 2, max = 30, message = "first name should have at least 2 characters")
	private String firstName;
	
	@Column(nullable = false)
	@NotBlank(message="last name should not be blank")
	@Size(min = 2, max = 30, message = "last name should have at least 2 characters")
	private String lastName;
	
	@NotBlank(message="emailId should not be blank")
	@Email
	private String emailId;

	@NotBlank(message="password should not be blank")
	@Size(min = 8, message = "password should have at least 8 characters")
	private String password;

	@NotBlank(message="mobile  Number  should not be blank")
	@Size(min = 10, max = 10, message = "Invalid Mobile Number")
	private String mobileNo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
	
}
