package com.movie.admin.exception;


public class DuplicateTheatreEntry extends Exception{
	private static final long serialVersionUID = 1L;
	public DuplicateTheatreEntry(String message) {
		super(message);
	}
}