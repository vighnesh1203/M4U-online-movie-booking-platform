package com.movie.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.dao.MovieDao;
import com.movie.dao.UserDao;
import com.movie.model.Movie;
import com.movie.model.Seat;
import com.movie.model.Show;
import com.movie.model.User;
import com.movie.model.UserBookedShows;
import com.movie.service.UserService;
import com.movie.user.exception.DateException;
import com.movie.user.exception.EmailIdException;
import com.movie.user.exception.InvalidSeatNoException;
import com.movie.user.exception.MovieNotFound;
import com.movie.user.exception.NoEmailIdExist;
import com.movie.user.exception.UserLoginFailException;

@Controller
public class UserController {
	//Dao interfaces
	@Autowired
	private UserService userSImpl;
	@Autowired
    private UserDao userDao;
	@Autowired
	private MovieDao md;
//	@Autowired
//	private PasswordEncoder passwordEncoder;
	
	Logger l = LoggerFactory.getLogger(UserController.class);
	
	@ExceptionHandler(value = DateException.class)
    public String dateException(Model model,HttpSession session) {
		String emailId=(String) session.getAttribute("emailId");
        model.addAttribute("msg", "No show is available on this date!!");
        l.error("No show is available on this date!!"+emailId);
        return "Date.jsp";

    }
	
	//Exception handling
	
    @ExceptionHandler(value = UserLoginFailException.class)
    public String loginFailed(Model model,HttpSession session) {
    	String emailId=(String) session.getAttribute("emailId");
        model.addAttribute("msg", "Invalid login Credentials!!");
        l.error("Invalid login Credentials with EmailId !!"+emailId);
        return "fail3.jsp";

    }

    @ExceptionHandler(value = InvalidSeatNoException.class)
    public String invalidSeat(Model model,HttpSession session) {
    	String emailId=(String) session.getAttribute("emailId");
    	String userId=(String) session.getAttribute("userId");
        model.addAttribute("msg", "Invalid seat number or seat number is unavailable or seat number is repeated!!");
        l.error("Invalid seat number or seat number is unavailable or seat number is repeated with emailId: "+emailId+" and UserId:"+userId);
        return "BookingFailed.jsp";
    }

    @ExceptionHandler(value = MovieNotFound.class)
    public String movieNotFound(Model model,HttpSession session) {
    	String emailId=(String) session.getAttribute("emailId");
    	String userId=(String) session.getAttribute("userId");
        model.addAttribute("msg", "Movie Not Found!!");
        l.error("Movie Not Found with emailId: "+emailId+" and UserId:"+userId);
        return "MovieNotFound.jsp";

    }

    @ExceptionHandler(value = EmailIdException.class)
    public String emailIdException(Model model) {
        model.addAttribute("msg", "Email Id should be unique!!");
        l.error("Email Id should be unique!!");
        return "EmailId.jsp";

    }

    @ExceptionHandler(value = NoEmailIdExist.class)
    public String noEmailId(Model model) {
        model.addAttribute("msg", "Email Id is not valid!!");
        l.error("Email Id is not valid!!");
        return "NoEmailIdExist.jsp";

    }
	
	//Login And Registration Page
	@RequestMapping("LoginPage")
	public String loginPage()
	{
		return "UserLogin.jsp";
		
	}
	//Registration
	@RequestMapping("UserRegistration")
	 public String registerUser(@Valid @ModelAttribute("URegistrationModel") User user,BindingResult br) throws EmailIdException 
	 {
		if(br.hasErrors())
		{
			return "Registration.jsp";
		}
		else
		{
//		user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        User savedUser = userSImpl.userRegister(user);
        return "UserLogin.jsp";
		}
    }
	
	@RequestMapping("UserRegistrationMap")
	public String userRegistration(User user,Model model)
	{
		
		model.addAttribute("URegistrationModel",new User());
		return "Registration.jsp";
	}
	
	//Login
	@RequestMapping("UserLogin")
	public String loginUser(HttpSession session,@RequestParam("emailId") String emailId,@RequestParam("password") String password,Model model) throws UserLoginFailException, NoEmailIdExist
	{
		//System.out.println("loginpage");
		session.setAttribute("emailId",emailId );
		if(userSImpl.userLogin(emailId,password)!=null)
		{
			//System.out.println("within if");
			String userId=userSImpl.userLogin(emailId,password);
			session.setAttribute("userId",userId);
			List<Movie> movieList=userSImpl.userFrontPage();
			model.addAttribute("MovieList", movieList);
			return "UserFrontPage";
		}
		return null;
		
	}

	
	//Edit Profile Page
	@RequestMapping("EditProfile")
	public String editProfilePage(HttpSession session,Model model)
	{
		if(session.getAttribute("userId")!=null)
		{
		String userId=(String) session.getAttribute("userId");
		User user=userSImpl.editProfilePage(userId);
		model.addAttribute("user", user);
		return "ProfileUpdate.jsp";
		}
		return "UserLogin.jsp";
		
	}
	
	//Update profile
	@RequestMapping("UpdateProfile")
	public String updateProfile(@Valid @ModelAttribute("UpdateModel") User user,BindingResult br,Model model)
	{
		if(br.hasErrors())
		{
			return "ProfileUpdate.jsp";
		}
		else
		{
		if(userSImpl.updateProfile(user))
		{
			List<Movie> movieList=userSImpl.userFrontPage();
			model.addAttribute("MovieList", movieList);
			return "UserFrontPage.jsp";
		}
		}
		return "fail3.jsp";
	}
	//update map
	@RequestMapping("UserUpdateMap")
	public String userUpdaion(Model model,HttpSession session)
	{
		if(session.getAttribute("userId")!=null)
		{
		String userId=(String) session.getAttribute("userId");
		User user=userSImpl.editProfilePage(userId);
		model.addAttribute("UpdateModel", user);
		return "ProfileUpdate.jsp";
		}
		return "UserLogin.jsp";
		//model.addAttribute("UpdateModel",new User());
	//	return "ProfileUpdate.jsp";
	}
	/*******************************/
	//User Front Page
	@RequestMapping("UserFrontPage")
	public String userFrontPage(Model model,HttpSession session)
	{
		String userId=(String) session.getAttribute("userId");
		List<Movie> movieList=userSImpl.userFrontPage();
		Set<String> locationList=userSImpl.locationList();
		model.addAttribute("LocationList", locationList);
		if(userId!=null)
		{
		User user=userSImpl.editProfilePage(userId);
		model.addAttribute("UserName", user.getFirstName());
		}
		model.addAttribute("MovieList", movieList);
		return "UserFrontPage.jsp";
		
	}
	
	//User Front  after selection location
	@RequestMapping("locationSearch")
	public String locationSearch(@RequestParam("city") String city,HttpSession session,Model model)
	{
		System.out.println("location");
		List<Movie> movieList=userSImpl.locationSearch(city);
		session.setAttribute("CityName", city);
	//	List<Movie> movieList=userSImpl.userFrontPage();
		Set<String> locationList=userSImpl.locationList();
		model.addAttribute("LocationList", locationList);
		model.addAttribute("MovieList", movieList);
		return "UserFrontPage.jsp";
		
	}
	
	//Movie Cards
	@RequestMapping("MoviesCards")
	public String movieCards(Model model)
	{
		List<Movie> movieList=md.findAll();
		List<Movie> marathiMovieList=userSImpl.movieCards("marathi");
		List<Movie> hindiMovieList=userSImpl.movieCards("Hindi");
		List<Movie> englishMovieList=userSImpl.movieCards("English");
		List<Movie> tamilMovieList=userSImpl.movieCards("tamil");
		List<Movie> teluguMovieList=userSImpl.movieCards("telugu");
		
		
		model.addAttribute("MarathiMovieList",marathiMovieList );
		model.addAttribute("HindiMovieList",hindiMovieList );
		model.addAttribute("EnglishMovieList", englishMovieList);
		model.addAttribute("TamilMovieList", tamilMovieList);
		model.addAttribute("TeluguMovieList", teluguMovieList);
		return "MovieCards.jsp";
	}
	
	
	//Particular  Movie Details
	@RequestMapping("MovieDetails")
	public String movieDetails(@RequestParam("movieId") String movieId,Model model)
	{
		System.out.println(movieId);
		Movie movie=userSImpl.movieDetails(movieId);
		model.addAttribute("Movie", movie);
		return "MovieDetails.jsp";
	}
	
	// Search Movie
	@RequestMapping("SearchMovie")
	public String searchMovie(Model model, @RequestParam("search") String movieName) throws MovieNotFound {

		if (userSImpl.searchMovie(movieName) == null) {
			return "fail3.jsp";
		} else {
			Movie movie = userSImpl.searchMovie(movieName);
			model.addAttribute("Movie", movie);
			return "MovieDetails.jsp";
		}
	}
	
	//Movie Shows Filtering
	@RequestMapping("MovieShows")
    public String movieShows(@RequestParam("movieId") String movieId, Model model, HttpSession session) {
		session.setAttribute("movieId", movieId);
        if (session.getAttribute("CityName") == null) {
            List<Show> showsList = userSImpl.movieShows(movieId);
            model.addAttribute("ShowsList", showsList);
            return "ShowsListUser.jsp";
        } else {
            List<Show> showsList = userSImpl.movieShows(movieId);
            List<Show> newShowList = new ArrayList<Show>();
            for (Show show : showsList) {
                if (show.getTheatre().getTheatreCity().equalsIgnoreCase((String) session.getAttribute("CityName"))) {
                    newShowList.add(show);
                }
            }
            model.addAttribute("ShowsList", newShowList);
            return "ShowsListUser.jsp";
        }

    }
	
	//Filter By Date
		@RequestMapping("filterByDate")
		public String filterByDate(Model model,HttpSession session,@RequestParam("movie-date") Date movieDate) throws DateException
		{
			String movieId=(String) session.getAttribute("movieId");
			if(session.getAttribute("CityName")==null)
			{
			List<Show> showsList=userSImpl.movieShows(movieId);
			showsList=userSImpl.filterByDate(movieDate,showsList);
			model.addAttribute("ShowsList", showsList);
			return "ShowsListUser.jsp";
			}
			else
			{
				List<Show> showsList=userSImpl.movieShows(movieId);
				List<Show> newShowList=new ArrayList<Show>();
				for(Show show:showsList)
				{
					if(show.getTheatre().getTheatreCity().equalsIgnoreCase((String) session.getAttribute("CityName")))
					{
						newShowList.add(show);
					}
				}
				
				newShowList=userSImpl.filterByDate(movieDate,showsList);
				model.addAttribute("ShowsList",newShowList);
				return "ShowsListUser.jsp";
			}
			
		}
	
	//Available seats and booking
	@RequestMapping("availableSeats")
	public String availableSeats(@RequestParam("showId") String showId,Model model,HttpSession session)
	{
		session.setAttribute("showId",showId);
		if(session.getAttribute("userId")==null)
		{
			return "UserLogin.jsp";
		}
		session.setAttribute("showId",showId);
		Show show=userSImpl.findShow(showId);
		List<Seat> seatList=show.getSeat();
		List<Integer> availableSeat=userSImpl.availableSeatsList(seatList);
		model.addAttribute("list", availableSeat);
		model.addAttribute("show", show);
		return "ShowSeat.jsp";
		
	}
	
	//Available seats and booking Refresh
		@RequestMapping("availableSeatsRefresh")
		public String availableSeats(Model model,HttpSession session)
		{
			String showId=(String) session.getAttribute("showId");
			if(session.getAttribute("userId")==null)
			{
				
				return "UserLogin.jsp";
			}
			session.setAttribute("showId",showId);
			Show show=userSImpl.findShow(showId);
			List<Seat> seatList=show.getSeat();
			List<Integer> availableSeat=userSImpl.availableSeatsList(seatList);
			model.addAttribute("list", availableSeat);
			model.addAttribute("show", show);
			return "ShowSeat.jsp";
		}
		
	//Check whether seats are available or not
	@RequestMapping("checkSeats")
	public String checkSeats(@RequestParam("message") String message,Model model,HttpSession session) throws InvalidSeatNoException
	{
		String showId=(String) session.getAttribute("showId");
		Show show=userSImpl.findShow(showId);
		
		List<Integer> seatNoList=new ArrayList<>();
		for (String s : message.split(",")) {
		    seatNoList.add(Integer.parseInt(s));
		}
		
		if(userSImpl.checkSeats(message, model, session, showId)==0)
		{
			return null;	
		}
		int seatCount=userSImpl.checkSeats(message, model, session, showId);
		
		session.setAttribute("seatCount", seatCount);
		
		session.setAttribute("seatNoList", seatNoList);
		model.addAttribute("TotalPrice", userSImpl.calculatePrice(seatCount,show.getCostOfTicket()));
		model.addAttribute("Show", show);
		return "Payment.jsp";
	}
	
	
	//Book seats and notify user
	@RequestMapping("Notification")
	public String confirmSeats(HttpSession session)
	{
		List<Integer> seatNoList=(List<Integer>) session.getAttribute("seatNoList");
		String showId=(String) session.getAttribute("showId");
		Show show=userSImpl.findShow(showId);
		if(userSImpl.confirmSeats(seatNoList,show))
		{
			return "Notify.jsp";
		}
		return "fail3.jsp";
		
	}
	
	// Print ticket details
	
    @RequestMapping("TicketDetails")
    public String ticketDetails(HttpSession session, Model model) {
        List<Integer> seatNoList = (List<Integer>) session.getAttribute("seatNoList");
        UserBookedShows u = new UserBookedShows();
        String bookedShowId = (String) session.getAttribute("showId");
        Show show = userSImpl.findShow(bookedShowId);
        u.setShowTime(show.getShTime());
        User user = userSImpl.findUser((String) session.getAttribute("userId"));
        u.setUser(user);
        u.setMovieName(show.getMovie().getMovieName());
        u.setShowDate(show.getShowDate());
    //    u.setTheatreId(show.getTheatre().getTheatreId());
        u.setTheatreCity(show.getTheatre().getTheatreCity());
        u.setTheatreName(show.getTheatre().getTheatreName());
        List<Integer> bookedSeatList = (List<Integer>) (session.getAttribute("seatNoList"));
        u.setSeatsList(bookedSeatList);
        u.setTotalSeats(bookedSeatList.size());
        u.setTotalPrice( userSImpl.calculatePrice(bookedSeatList.size(),show.getCostOfTicket()));
        u.setImage(show.getMovie().getImage());
        UserBookedShows userDetails = userSImpl.storeDetails(u);
        model.addAttribute("userDetails", userDetails);
        return "TicketDetails.jsp";

    }
    
    //My Order
    
    @RequestMapping("MyOrderUser")
    public String myOrder(HttpSession session,Model m) {
    	String showId=(String) session.getAttribute("showId");
		if(session.getAttribute("userId")==null)
		{
			return "UserLogin.jsp";
		}
    	List<UserBookedShows> ubsList=userSImpl.listUser();
    	User user = userSImpl.findUser((String) session.getAttribute("userId"));
    	List<UserBookedShows> pubs=new ArrayList<UserBookedShows>();
    	for(UserBookedShows u1:ubsList)
          {
    		
    		if(u1.getUser().getId()==user.getId())
              {
                  pubs.add(u1);
              }
          }
    	m.addAttribute("booklist",pubs);
    	return "MyOrders.jsp";
    }
    
    @RequestMapping("MovieShowsRefresh")
    public String movieShows( Model model, HttpSession session) {
        String movieId=(String) session.getAttribute("movieId");
        if (session.getAttribute("CityName") == null) {
            List<Show> showsList = userSImpl.movieShows(movieId);
    
            model.addAttribute("ShowsList", showsList);
            return "ShowsListUser.jsp";
        } else {
            List<Show> showsList = userSImpl.movieShows(movieId);
            List<Show> newShowList = new ArrayList<Show>();
            for (Show show : showsList) {
                if (show.getTheatre().getTheatreCity().equalsIgnoreCase((String) session.getAttribute("CityName"))) {
                    newShowList.add(show);
                }
            }
            model.addAttribute("ShowsList", newShowList);
            return "ShowsListUser.jsp";
        }
    }
	//LogOut
	@RequestMapping("LogOut")
	public String logOut(HttpSession session)
	{
		session.setAttribute("userId", null);
		return "UserFrontPage";
	}
	
	
	

}
