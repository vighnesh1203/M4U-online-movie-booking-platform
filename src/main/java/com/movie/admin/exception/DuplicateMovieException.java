package com.movie.admin.exception;


public class DuplicateMovieException extends Exception{
	private static final long serialVersionUID = 1L;
	public DuplicateMovieException(String message) {
		super(message);
	}
}