package com.movie.admin.exception;



public class TheatreNotFoundException extends Exception {
	private static final long serialVersionUID = 1L;
	public TheatreNotFoundException(String message) {
		super(message);
	}
}
