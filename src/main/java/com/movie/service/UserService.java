package com.movie.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.dao.MovieDao;
import com.movie.dao.SeatDao;
import com.movie.dao.ShowDao;
import com.movie.dao.TheatreDao;
import com.movie.dao.UserBookedShowsDao;
import com.movie.dao.UserDao;
import com.movie.model.Movie;
import com.movie.model.Seat;
import com.movie.model.Show;
import com.movie.model.Theatre;
import com.movie.model.User;
import com.movie.model.UserBookedShows;
import com.movie.user.exception.DateException;
import com.movie.user.exception.EmailIdException;
import com.movie.user.exception.InvalidSeatNoException;
import com.movie.user.exception.MovieNotFound;
import com.movie.user.exception.NoEmailIdExist;
import com.movie.user.exception.UserLoginFailException;

@Service
public class UserService implements UserServiceImpl {
	@Autowired
	private UserDao userDao;

	@Autowired
	private TheatreDao td;
	@Autowired
	private MovieDao md;
	@Autowired
	private ShowDao showDao;

	@Autowired
	private SeatDao std;
	@Autowired
	private UserBookedShowsDao ubsd;

	@Override
	public User userRegister(User user) throws EmailIdException
    {
		List<User> lUser=userDao.findAll();
        if(lUser.size()==0) {
             User newUser = userDao.save(user);
                return newUser;
        }
        for(User u:lUser)
        {
            if(u.getEmailId().equalsIgnoreCase(user.getEmailId()))
            {
                throw new EmailIdException("Email Id should be unique");
            }
                
        }
        User newUser = userDao.save(user);
        return newUser;
        
    }

	@Override
	public String userLogin(String emailId, String password) throws UserLoginFailException, NoEmailIdExist {
        // TODO Auto-generated method stub
        if (emailId.length()==0) {
            throw new UserLoginFailException("Invalid login Credentials");
        } 
        else  
        {
            if(userDao.findByEmailId(emailId).isEmpty()) {
                throw new NoEmailIdExist("Email id is not valid");
            }
            User user = userDao.findByEmailId(emailId).get(0);
            if (user.getEmailId().equals(emailId) && user.getPassword().equals(password)) {
                return user.getId();
            } 
            throw new UserLoginFailException("Invalid login Credentials");
        }
        
    }

	// Edit Profile Page
	@Override
	public User editProfilePage(String userId) {
		User user = userDao.findById(userId).get();
		return user;
	}

	// update Profile
	@Override
	public boolean updateProfile(User user) {
		User user1 = userDao.findByEmailId(user.getEmailId()).get(0);
		user.setId(user1.getId());
		userDao.save(user);
		return true;
	}

	// Front Page
	@Override
	public List<Movie> userFrontPage() {
		List<Movie> movieList = md.findAll();
		return movieList;
	}

	// Location list
	@Override
	public Set<String> locationList() {
		List<Theatre> tlist = td.findAll();
		List<String> locationList = new ArrayList<String>();
		for (Theatre t : tlist) {
			locationList.add(t.getTheatreCity());
		}
		Set<String> set = new HashSet<String>(locationList);
		return set;

	}

	// Movie Cards
	@Override
	public List<Movie> movieCards(String language) {
		List<Movie> languageList = new ArrayList<>();
		List<Movie> movieList = md.findAll();
		for (Movie movie : movieList) {
			if (movie.getLanguage().equalsIgnoreCase(language)) {
				languageList.add(movie);
			}
		}
		return languageList;

	}

	// Location Search
	@Override
	public List<Movie> locationSearch(String city) {
		System.out.println("method");
//		List<Theatre> theatreList = td.findAll();
		List<Movie> newList = new ArrayList<Movie>();
		List<Theatre> tlist = td.findAll();
		for (Theatre t : tlist) {
			if (t.getTheatreCity().equals(city)) {
				List<Show> st = t.getShowList();
				for (Show ns : st) {
					if (newList.contains(ns.getMovie())) {
						continue;
					} else {
						newList.add(ns.getMovie());
					}
				}
			}
		}
		return newList;
	}

	// particular Movie Details
	@Override
	public Movie movieDetails(String movieId) {
		System.out.println(movieId);
		Movie movie = md.findById(movieId).get();
		return movie;
	}

	// Search Movie
	public Movie searchMovie(String movieName) throws MovieNotFound {
		List<Movie> movieList = md.findAll();
		for (Movie movie : movieList) {
			if (movie.getMovieName().equalsIgnoreCase(movieName)) {
				return movie;
			}
		}
		throw new MovieNotFound("Movie Not Found");
	}

	// Movie Show filtering
	@Override
	public List<Show> movieShows(String movieId) {
		// TODO Auto-generated method stub

		Movie movie = md.findById(movieId).get();
		List<Show> showsList = showDao.findByMovie(movie);
		return showsList;
	}

	// show which user selected (used for Available Seats )
	@Override
	public Show findShow(String showId) {
		Show show = showDao.findById(showId).get();
		return show;
	}

	// Available Seats List
	@Override
	public List<Integer> availableSeatsList(List<Seat> seatList) {
		// TODO Auto-generated method stub
		List<Integer> availableSeat = new ArrayList<>();
		for (Seat s : seatList) {
			if (s.getSeatNo() == 0) {
				availableSeat.add(s.getSeatIndex());
			}
		}
		return availableSeat;
	}

	// Check whether User Entered right seat numbers
	@Override
	public int checkSeats(@RequestParam("list") String total, Model m, HttpSession session, String showId)
			throws InvalidSeatNoException {
		Show show = showDao.findById(showId).get();
		// Screen screen=show.getShScreen();

		List<Integer> seatNoList = new ArrayList<>();
		for (String s : total.split(",")) {
			seatNoList.add(Integer.parseInt(s));
		}
		List<Seat> seatList = show.getSeat();

		// duplicate entries
		Set<Integer> set = new HashSet<Integer>(seatNoList);
		if (set.size() < seatNoList.size()) {
			throw new InvalidSeatNoException("Invalid seat number or seat number is unavailable or seat number is repeated!!");
		}

		// check seat number is available or not
		List<Integer> seatNosList = new ArrayList<>();
		for (Seat s : seatList) {
			seatNosList.add(s.getSeatNo());
		}

		for (int i : seatNoList) {
			if (seatNosList.contains(i)) {
				throw new InvalidSeatNoException("Invalid seat number or seat number is unavailable or seat number is repeated!!");
			}
		}

		for (int i : seatNoList) {
			if (i > 20) {
				throw new InvalidSeatNoException("Invalid seat number or seat number is unavailable or seat number is repeated!!");
			}
		}
		return seatNoList.size();
	}

	// allocate seats to user
	@Override
	public boolean confirmSeats(List<Integer> seatNoList, Show show) {
		List<Seat> seatList1 = show.getSeat();
		for (Seat s : seatList1) {
			if (seatNoList.contains(s.getSeatIndex())) {
				s.setSeatNo(s.getSeatIndex());
				std.save(s);
			} else {
				continue;
			}
		}
		show.setSeat(seatList1);
		showDao.save(show);
		return true;

	}

	// filter By Date
	@Override
	public List<Show> filterByDate(Date movieDate, List<Show> showsList) throws DateException {
		// TODO Auto-generated method stub
		List<Show> newShowList = new ArrayList<Show>();
		for (Show show : showsList) {
			if (show.getShowDate().compareTo(movieDate) == 0) {
				newShowList.add(show);
			}
		}
		if(newShowList.size()==0)
		{
			throw new DateException("Please enter date in correct format");
		}
		return newShowList;
	}

	public User findUser(String uid)
	{
		User user=userDao.findById(uid).get();
		return user;
	}
	
	//User details after Booking
	public UserBookedShows storeDetails(UserBookedShows user)
	{
		return ubsd.save(user);
	}
	
	//Find All Users
	public List<UserBookedShows> listUser() {
		List<UserBookedShows> ubsList=ubsd.findAll();
		return ubsList;
	}
	//Calculate price
	public int calculatePrice(int size,int price) {
		return size*price;
	}
}
