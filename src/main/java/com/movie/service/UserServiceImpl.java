package com.movie.service;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.movie.model.Movie;
import com.movie.model.Seat;
import com.movie.model.Show;
import com.movie.model.User;
import com.movie.user.exception.DateException;
import com.movie.user.exception.EmailIdException;
import com.movie.user.exception.InvalidSeatNoException;
import com.movie.user.exception.NoEmailIdExist;
import com.movie.user.exception.UserLoginFailException;

public interface UserServiceImpl {

	User userRegister(User user) throws EmailIdException;

	String userLogin(String emailId, String password) throws UserLoginFailException, NoEmailIdExist;

	User editProfilePage(String userId);

	boolean updateProfile(User user);

	List<Movie> userFrontPage();

	Set<String> locationList();

	List<Movie> movieCards(String language);

	List<Movie> locationSearch(String city);

	Movie movieDetails(String movieId);

	List<Show> movieShows(String movieId);

	List<Show> filterByDate(Date movieDate, List<Show> showsList) throws DateException;

	boolean confirmSeats(List<Integer> seatNoList, Show show);

	int checkSeats(String total, Model m, HttpSession session, String showId) throws InvalidSeatNoException;

	List<Integer> availableSeatsList(List<Seat> seatList);

	Show findShow(String showId);
	
}
