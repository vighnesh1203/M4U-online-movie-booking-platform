package com.movie.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.movie.admin.exception.AdminNotFoundException;
import com.movie.admin.exception.DuplicateMovieException;
import com.movie.admin.exception.DuplicateTheatreEntry;
import com.movie.admin.exception.MovieNotFoundException;
import com.movie.admin.exception.TheatreNotFoundException;
import com.movie.model.Admin;
import com.movie.model.Movie;
import com.movie.model.Show;
import com.movie.model.Theatre;
import com.movie.service.AdminService;
import com.movie.user.exception.DeleteShowException;

@Controller
public class AdminController {
	@Autowired
	private AdminService ms;
	
	Logger l = LoggerFactory.getLogger(AdminController.class);

	@ExceptionHandler(value = DeleteShowException.class)
	public String deleteShow(Model m) {
		m.addAttribute("msg", "First delete the show then try to delete it again ");
		l.error("First delete the show then try to delete it again ");
		return "DeleteShow.jsp";
	}
	
	@ExceptionHandler(value = AdminNotFoundException.class)
	public String adminNotFound(Model m,HttpSession session) {
		String adminId=(String) session.getAttribute("adminId");
		m.addAttribute("msg", "Invalid Admin Credentials!!");
		l.error("Invalid Admin Credentials!! With AdminId"+adminId);
		return "fail.jsp";
	}

	@RequestMapping("adminl")
	public String adminLogin1(Model m) {
		m.addAttribute("adm", new Admin());
		return "Admin.jsp";
	}

	@RequestMapping("adminLogin")
	public String adminLogin(@RequestParam("adminUserId")String adminId, @Valid @ModelAttribute("adm") Admin admin, BindingResult br,HttpSession session)
			throws AdminNotFoundException {
		session.setAttribute("adminId",adminId);
		if (br.hasErrors()) {
			return "Admin.jsp";
		} else if (ms.adminLogin(admin.getAdminUserId(), admin.getPassword())) {
			return "adds1";
		}
		throw new AdminNotFoundException(" Admin not Found !!");
	}
	
   // DropDown
	@RequestMapping("adds1")
	public String getDropdown(Model m) {
		HashMap<String, ArrayList<String>> hm = ms.getDropDown();
		m.addAttribute("citymap", hm);
		return "index1.jsp";
	}
	
	@RequestMapping("movie")
	public String movie() {
		return "movie.jsp";
	}

	// Add Theatre
	
	@ExceptionHandler(value = DuplicateTheatreEntry.class)
	public String duplicateTheatreException(Model m) {
		m.addAttribute("msg", "Duplicate Theatre Entry!!");
		l.error("Duplicate Theatre Entry!!");
		return "fail1.jsp";
	}

	
	@RequestMapping("addTheatre")
	public String addtheatre(Theatre t, Model mm) throws DuplicateTheatreEntry {
		if (ms.addTheatre(t)) {
			mm.addAttribute("msg", "Theatre Added Successfully!!");
			return "success.jsp";
		}
		mm.addAttribute("msg", "Theatre Not Added!!");
		return "fail1.jsp";
	}

//	 Add Movies

	@RequestMapping("addMovie")
	public String addMovie(@RequestParam("multipartFile") MultipartFile multipartFile, Movie m, Model mm)
			throws DuplicateMovieException {
//		if (br.hasErrors()){
//			return "addmovie.jsp";
//		}
		if (ms.movieAdd(m, multipartFile)) {
			ms.saveImage(multipartFile);
			mm.addAttribute("msg", "Movie Added Succcessfully!!");
			return "success.jsp";
		}
		return "fail.jsp";
	}

	@ExceptionHandler(value = { DuplicateMovieException.class })
	public String duplicateMovieException(Model m) {
		m.addAttribute("msg", "Duplicate Movie Entry!!");
		l.error("Duplicate Movie Entry!!");
		return "fail1.jsp";
	}

	// Theatre Delete
	@RequestMapping("deleteTheatreMapping")
	public String deleteTheatre(@RequestParam("theatreId") String tId, Model mm) throws DeleteShowException {
		if (ms.deleteTheatre(tId)) {
			mm.addAttribute("msg", "Theatre Deleted Successfully!!");
//			l.error("Error");
			return "success.jsp";
		}
		mm.addAttribute("msg", "Theatre Not Deleted!!");
		return "fail.jsp";
	}

	// Add Show
	
	@ExceptionHandler(value = MovieNotFoundException.class)
	public String duplicateMovieException1(Model m) {
		m.addAttribute("msg", "Movie not Found or Invalid date !!");
		l.error("Movie not Found or Invalid date !!");
		return "fail1.jsp";
	}

	@RequestMapping("addShow")
	public String addShow(@RequestParam("movieName") String mName, @RequestParam("theatreCity") String tCity,
			@RequestParam("showTime") String showTime, @RequestParam("theatreName") String tName,
			@RequestParam("costOfTicket") int cost, @RequestParam("showDate") Date showDate, Show s, Model m)
			throws MovieNotFoundException {
		if (ms.addShow(mName, tCity, showTime, cost, tName, showDate, s)) {
			m.addAttribute("msg", "Show Added Successfully!!");
			return "success.jsp";
		}
		
		return "fail2.jsp";

	}


	// Show List

	@RequestMapping("showList2")
	public String getShowList(Model m) {
		m.addAttribute("sList", ms.showList());
		return "showList.jsp";
	}

	// Delete Show

	@RequestMapping("deleteShowMapping")
	public String deleteShow(@RequestParam("shId") String showId, @RequestParam("movieName") String movieName,
			@RequestParam("theatreName") String theatreName,Model m) {
		if (ms.deleteShow(showId, movieName, theatreName)) {
			m.addAttribute("msg","Show Deleted Successfully!!");
			return "success.jsp";
		}
		
		return "fail2.jsp";
	}

	// Movie Update

	@RequestMapping("updateMovie")
	public String updateMovie(Movie m, @RequestParam("multipartFile") MultipartFile multipart, Model mm,
			HttpSession session) {

		String mid = (String) session.getAttribute("movieId");
		if (ms.updateMovie(m, mid, multipart)) {
			ms.updateImage(multipart);
			mm.addAttribute("msg", "Movie Updated Successfully");
			return "success.jsp";
		}
		return "fail.jsp";
	}
	
	// Update Movie Mapping

	@RequestMapping("updateMovieMapping")
	public String updateMappingMovie(@RequestParam("movieId") String movieId, HttpSession session, Model m) {
		session.setAttribute("movieId", movieId);
		Movie mo = ms.getMovie(movieId);
		m.addAttribute("movie", mo);
		return "update-Movie.jsp";
	}

	// Delete Movie Mapping

	@RequestMapping("deleteMovieMapping")
	public String deleteMappingMovie(Model mm, @RequestParam("movieId") String movieId, HttpSession session) throws DeleteShowException {
		if (ms.deleteMovie(movieId)) {
			mm.addAttribute("msg", "Movie Deleted Successfully");
			return "success.jsp";
		}
		mm.addAttribute("msg", "Movie Not Deleted");
//		l.error("Movie Not Deleted");
		return "fail.jsp";
	}

	// Movie List

	@RequestMapping("MovieList")
	public String getMovieList(Model m) {
		m.addAttribute("list", ms.movieList());
		return "all-movies.jsp";
	}

	// Theatre List

	@RequestMapping("TheatreList1")
	public String getTheatreList(Model m) {
		m.addAttribute("tlist", ms.theatreList());
		return "theatres.jsp";
	}
	
	
	

}
