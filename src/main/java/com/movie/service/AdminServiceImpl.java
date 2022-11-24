package com.movie.service;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.movie.admin.exception.AdminNotFoundException;
import com.movie.admin.exception.DuplicateMovieException;
import com.movie.admin.exception.DuplicateTheatreEntry;
import com.movie.admin.exception.MovieNotFoundException;
import com.movie.model.Movie;
import com.movie.model.Show;
import com.movie.model.Theatre;
import com.movie.user.exception.DeleteShowException;

public interface AdminServiceImpl {

	boolean adminLogin(String id, String password) throws AdminNotFoundException;

	boolean addTheatre(Theatre t) throws DuplicateTheatreEntry;

	boolean movieAdd(Movie movie, MultipartFile multipartFile) throws DuplicateMovieException;

	void saveImage(MultipartFile multipartFile);

	boolean addShow(String mName, String tCity, String showTime, int costOfTicket, String tName, Date showDate, Show sh)
			throws MovieNotFoundException;

	boolean updateMovie(Movie m, String mId, MultipartFile multipart);

//	boolean updateTheatre(String theatreId, String theatreName, String theatreCity);

	boolean updateShow(String shId, String showTime, int costOfSeat);

	boolean deleteMovie(String movieId) throws DeleteShowException;

	boolean deleteShow(String showId,String movieName,String theatreName);

	boolean deleteTheatre(String theatreId) throws DeleteShowException;

	List<Theatre> theatreList();

	List<Movie> movieList();

	List<Show> showList();

	Movie getMovie(String mId);

}
