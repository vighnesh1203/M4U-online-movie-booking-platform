package com.movie;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.contains;

import java.util.List;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.movie.dao.AdminDao;
import com.movie.dao.MovieDao;
import com.movie.dao.SeatDao;
import com.movie.dao.ShowDao;
import com.movie.dao.TheatreDao;
import com.movie.dao.UserBookedShowsDao;
import com.movie.dao.UserDao;
import com.movie.model.Admin;
import com.movie.model.Movie;
import com.movie.model.Seat;
import com.movie.model.Show;
import com.movie.model.Theatre;
import com.movie.model.User;
import com.movie.model.UserBookedShows;
//@TestMethodOrder(OrderAnnotation.class)
@SpringBootTest
class MovieBookingSiteDemoRoughApplicationTests {
	@Autowired
	private MovieDao md;
	@Autowired
	private TheatreDao td;
	@Autowired
	private UserDao ud;
	@Autowired
	private ShowDao sd;
	@Autowired
	private SeatDao std;
	@Autowired
	private AdminDao ad;
	@Autowired
	private UserBookedShowsDao ubs;
	
	//Theatre Crud Testing
	@Test
//	@Order(1)
	public void testAddTheatre() {
		Theatre th=new Theatre();
		th.setTheatreName("Multiplex");
		th.setTheatreCity("Nashik");
		td.save(th);
		assertNotNull(td.findById("TH0008"));
//		assertNotNull(td.findByTheatreName("E-Square"));
	}
	
	@Test
//	@Order(2)
	public void testGetTheatre() {
        List<Theatre> theatre = td.findAll();
        assertThat(theatre).size().isGreaterThan(0);
    }
	
	@Test
//	@Order(3)
	public void testGetTheatreById() {
        Theatre th = td.findById("TH0008").get();
        assertEquals("Multiplex", th.getTheatreName());
    }
	
	@Test
//	@Order(4)
	public void testUpdateTheatre() {
        Theatre th = td.findById("TH0005").get();
        th.setTheatreName("Natvar Talkies");
        td.save(th);
        assertEquals("Natvar Talkies", th.getTheatreName());
    }
	
	@Test
	public void testDeleteTheatre() {
        td.deleteById("TH0001");
        assertThat(td.existsById("TH0001")).isFalse();
    }
	
	//User Testing
	
	@Test
	public void testAddUser() {
		User user=new User();
		user.setFirstName("Rushikesh");
		user.setLastName("Sapkale");
		user.setMobileNo("9458478745");
		user.setEmailId("rushi@gamil.com");
		user.setPassword("Rushi@123");
		ud.save(user);
		assertNotNull(ud.findById("U_08"));
	}
	
	
	@Test
	public void testGetUser() {
        List<User> user = ud.findAll();
        assertThat(user).size().isGreaterThan(0);
    }
	@Test
//	@Order(8)
	public void testUpdateUser() {
        User user = ud.findById("U_02").get();
        user.setFirstName("Vighnesh");
        user.setLastName("Paradkar");
        user.setEmailId("viighu@gmail.com");
        ud.save(user);
        assertEquals("Vighnesh", user.getFirstName());
    }
	
	//Exceptions User
	
	//EmailId Present or not Exception...
	@Test
	public void testEmailIdException() {
		List<User> lUser= ud.findByEmailId("sfhjdsbrf@gmail.com");//fail
//		List<User> lUser= ud.findByEmailId("rithik@gmail.com"); pass
        assertThat(lUser).size().isGreaterThan(0);
		
	}
	//Invalid Login Credentials
	@Test
	public void testInvalidLoginCredential() {
		List<User> lUser= ud.findByEmailId("ritik@gmail.com");
		for(User u:lUser) {
		assertEquals("Rithik@123",u.getPassword());//pass
//		assertEquals("Riik@123",u.getPassword());fail
		}
	}
	//Movie Not Found Exception
	@Test
	public void testmovieException() {
//		Movie movie=md.findByMovieName("Robot");//Fail
		Movie movie = md.findByMovieName("Adipurush");//pass
		assertNotNull(movie);
	}
	
	//Invalid Seat Number Exception
//	@Test
//	public void inavlidSeatNumberException() {
//		Show show=sd.findById("SHOW10").get();
//		List<Seat> sList=show.getSeat();
////		assertFalse(sList.contains(new Seat(3)));
//		assertThat(sList,contains(new Seat(2)));
//	}
	
	//Admin Exception
	
	//Admin Not Found Exception
	@Test
	public void adminNotFoundException() {
//		Admin admin =ad.findById("AD001").get();//pass
		Admin admin =ad.findById("AD002").get();//fail
		assertNotNull(admin);
	}
	
	@Test
	public void adminpasswordException() {
		Admin admin=ad.findById("AD001").get();
//		assertEquals("Rithik", admin.getPassword());//pass
		assertEquals("Rithik@123", admin.getPassword());//fail
	}
	
	//Registration Exception
//	@Test
//	public void regiEmailIdException() {
//		User user=new User();
//		user.setEmailId("ritik@gmail.com");
//		user.setFirstName(");
//	}
	
	//Ticket Price
	@Test
	public void calculatePrice() {
		UserBookedShows userBooked=ubs.findById(121).get();
//		Show show=sd.findById("SHOW04").get(); pass
		Show show=sd.findById("SHOW05").get();//fail
		assertEquals(userBooked.getTotalPrice(), userBooked.getTotalSeats()*show.getCostOfTicket());
	}
	
	
	
}
