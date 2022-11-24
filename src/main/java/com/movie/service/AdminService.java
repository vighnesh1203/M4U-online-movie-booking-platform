package com.movie.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.movie.admin.exception.AdminNotFoundException;
import com.movie.admin.exception.DuplicateMovieException;
import com.movie.admin.exception.DuplicateTheatreEntry;
import com.movie.admin.exception.MovieNotFoundException;
import com.movie.admin.exception.TheatreNotFoundException;
import com.movie.dao.AdminDao;
import com.movie.dao.MovieDao;
import com.movie.dao.SeatDao;
import com.movie.dao.ShowDao;
import com.movie.dao.TheatreDao;
import com.movie.model.Admin;
import com.movie.model.Movie;
import com.movie.model.Seat;
import com.movie.model.Show;
import com.movie.model.Theatre;
import com.movie.user.exception.DeleteShowException;

@Service
public class AdminService implements AdminServiceImpl{
	@Autowired
	private TheatreDao td;
	@Autowired
	private MovieDao md;
	@Autowired
	private ShowDao sd;
	@Autowired
	private AdminDao ad;
	@Autowired
	private SeatDao std;
	
	@Override
	public boolean adminLogin(String id,String password ) throws AdminNotFoundException {
		Admin admin= ad.findById(id).get();
		if(admin.getPassword().equals(password)) {
			return true;
		}
		return false;
	}
	@Override
	public boolean addTheatre(Theatre t) throws  DuplicateTheatreEntry {
		List<Theatre> th = td.findAll();
		for(Theatre t1:th) {
			if (t1.getTheatreCity().equals(t.getTheatreCity())&& t1.getTheatreName().equals(t.getTheatreName())) {
				throw new DuplicateTheatreEntry("Duplicate Theatre Entry");
			}
		}
		td.save(t);
		return true;
	}
	@Override
	public boolean movieAdd(Movie movie, MultipartFile multipartFile) throws DuplicateMovieException {
		List<Movie> mList = md.findAll();
		for(Movie m:mList) {
			if (m.getMovieName().equals(movie.getMovieName()) && m.getLanguage().equals(movie.getLanguage())) {
				throw new DuplicateMovieException("Duplicate Movie Entry");
			}
		}
		String fileName = multipartFile.getOriginalFilename();
		String filePath = null;
		System.out.println(fileName);
		if (fileName.contains("..")) {
//					throw new fileNameException()
		} else {
//			

			filePath = "http://localhost:9099/images/" + fileName;
			System.out.println(filePath);
			movie.setImage(filePath);
			md.save(movie);
		}
		return true;

	}
	@Override
	// pic uploading to server
	public void saveImage(MultipartFile multipartFile) {
		// TODO Auto-generated method stub
		String fileName = multipartFile.getOriginalFilename();
		System.out.println(fileName);
		String directoryPath = null;
		if (fileName.contains("..")) {
//					throw new fileNameException()
		} else {
			Path currentRelativePath = Paths.get("");
			Path s = currentRelativePath.toAbsolutePath();
			System.out.println(s);
			directoryPath = s + "/src/main/resources/static/images/"; /* +category.getCategoryTitle() */
			System.out.println(directoryPath);
			Path path = Paths.get(directoryPath);
			File file = new File(directoryPath);
			System.out.println(file);
			if (!file.exists()) {
				try {
					file.createNewFile();

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			try (InputStream inputStream = multipartFile.getInputStream()) {
				Path filePath = path.resolve(fileName);
				System.out.println(filePath);
				Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException ioe) {
//	            throw new IOException("Could not save image file: " + fileName, ioe);
				ioe.printStackTrace();
			}
		}

	}

	// pic uploading to server
	public void updateImage(MultipartFile multipartFile) {
		// TODO Auto-generated method stub
		String fileName = multipartFile.getOriginalFilename();
		System.out.println(fileName);
		String directoryPath = null;
		if (fileName.contains("..")) {
//					throw new fileNameException()
		} else {
			Path currentRelativePath = Paths.get("");
			Path s = currentRelativePath.toAbsolutePath();
			System.out.println(s);
			directoryPath = s + "/src/main/resources/static/updateImage/"; /* +category.getCategoryTitle() */
			System.out.println(directoryPath);
			Path path = Paths.get(directoryPath);
			File file = new File(directoryPath);
			System.out.println(file);
			if (!file.exists()) {
				try {
					file.createNewFile();

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			try (InputStream inputStream = multipartFile.getInputStream()) {
				Path filePath = path.resolve(fileName);
				System.out.println(filePath);
				Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}

	}
	@Override
	public boolean addShow(String mName, String tCity, String showTime, int costOfTicket, String tName, Date showDate,
			Show sh) throws MovieNotFoundException {
		boolean flag = false;
		List<Movie> mlist = md.findAll();
		for (Movie m : mlist) {
			if (m.getMovieName().equals(mName)) {
				if(showDate.after(m.getReleaseDate()) || showDate.equals(m.getReleaseDate())) {
				flag = true;
				}
			}
		}
		if (flag) {
			Movie movie =(Movie) md.findByMovieName(mName);
			Theatre theatre =td.findByTheatreName(tName);
//			List<Theatre> theatreList=td.findAll();
//			for(Theatre th:theatreList) {
//				if(th.getTheatreName().equals(tName) && th.getTheatreCity().equals(tCity)) {
//					
//				}
//			}
			Show show=new Show();
			show.setShTime(showTime); 
			show.setCostOfTicket(costOfTicket);
			show.setShowDate(showDate);
			show.setMovie(movie);
			show.setTheatre(theatre);
			
			List<Seat> seatList=new ArrayList<Seat>();
			 for (int i=1;i<=20;i++)
				 {
				 Seat newSeat=new Seat(i,0);
			     sd.save(show);
				 newSeat.setShow(show);;
				 seatList.add(newSeat);
				//std.save(new Seat(0));
			 }
			 std.saveAll(seatList);
			 show.setSeat(seatList);
			 
			 
			 sd.save(show);
			List<Show> sList = movie.getShow();
			sList.add(show);
			movie.setShow(sList);
			md.save(movie);
			List<Show> sListT = theatre.getShowList();
			sListT.add(show);
			theatre.setShowList(sListT);
			td.save(theatre);
			
			return true;
		} else {
			throw new MovieNotFoundException("Movie Not Found or Invalid Date");
		}
	}
	@Override
	public boolean updateMovie(Movie m,String mId,MultipartFile multipart ) {
		Movie m1=md.findById(mId).get();
		String fileName=multipart.getOriginalFilename();
		String filePath=null;
		System.out.println(fileName);
		filePath = "http://localhost:9098/images/" + fileName; /* +category.getCategoryTitle()+"/" */
		System.out.println(filePath);
		m1.setImage(filePath);
		m1.setMovieName(m.getMovieName());
		m1.setCoActor1(m.getCoActor1());
		m1.setCoActor2(m.getCoActor2());
		m1.setDescription(m.getDescription());
		m1.setGenre(m.getGenre());
		m1.setImage(m.getImage());
		m1.setLanguage(m.getLanguage());
		m1.setLeadActor(m.getLeadActor());
		m1.setLeadActress(m.getLeadActress());
		m1.setRating(m.getRating());
		m1.setReleaseDate(m.getReleaseDate());
		m1.setTimeDuration(m.getTimeDuration());
		md.save(m1);
		return true;
	}
	//Not in use
	@Override
	public boolean updateShow(String shId,String showTime,int costOfSeat) {
		Show show=sd.findById(shId).get();
		show.setShTime(showTime);
		show.setCostOfTicket(costOfSeat);
		sd.save(show);
		return true;
	}
	
	@Override
	public boolean deleteMovie(String movieId) throws DeleteShowException {
		Movie movie=md.findById(movieId).get();
        List<Show> showList=sd.findByMovie(movie);
        if(showList.size()>0)
        {
            throw new DeleteShowException("First delete the show then try to delete it again ");
        }
        md.delete(movie);
        return true;
	}
	@Override
	public boolean deleteShow(String showId,String movieName,String theatreName) {
		Show show=sd.findById(showId).get();
		
		Movie movie=md.findByMovieName(movieName);
		List<Show> sList=show.getMovie().getShow();
		sList.remove(show);
		movie.setShow(sList);
		md.save(movie);
		
		Theatre theatre =(Theatre) td.findByTheatreName(theatreName);
		List<Show> sList1=show.getTheatre().getShowList();
		sList1.remove(show);
		theatre.setShowList(sList1);
		td.save(theatre);
		
		List<Seat> seatlist =show.getSeat();
		sd.delete(show);
		std.deleteAll(seatlist);
		return true;
	}
	@Override
	public boolean deleteTheatre(String theatreId) throws DeleteShowException {
		Theatre theatre=td.findById(theatreId).get();
        List<Show> showList=sd.findByTheatre(theatre);
        if(showList.size()>0)
        {
            throw new DeleteShowException("First delete the show then try to delete it again ");
        }
        td.delete(theatre);
        return true;
	}
	@Override
	public List<Theatre> theatreList(){
		List<Theatre> tList=td.findAll();
		return tList;
	}
	
	@Override
	public List<Movie> movieList() {
		List<Movie> mList=md.findAll();
		return mList;
	}
	
	@Override
	public List<Show> showList(){
		List<Show> showList=sd.findAll();
		return showList;
	}
	
	public HashMap<String,ArrayList<String>> getDropDown() {
		List<Theatre> tlist= td.findAll();
		HashMap<String,ArrayList<String>> hst= new HashMap<String,ArrayList<String>>();
		for (Theatre t: tlist) {
			if (hst.get(t.getTheatreCity()) == null) 
			    hst.put(t.getTheatreCity(), new ArrayList<String>());
			hst.get(t.getTheatreCity()).add(t.getTheatreName());
		}
		return hst;
	}
	@Override
	public Movie getMovie(String mId) {
		Movie mo = md.findById(mId).get();
		return mo;
	}
	
}
