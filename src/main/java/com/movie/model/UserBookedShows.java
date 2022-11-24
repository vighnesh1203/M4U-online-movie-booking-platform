package com.movie.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class UserBookedShows {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int ubsId;
    private String showTime;
    private Date showDate;
    private String movieName;
    private String theatreName;
    private String theatreCity;
    private int totalSeats;
    private int totalPrice;
    private String image;
    private ArrayList<Integer> seatsList=new ArrayList<Integer>();
    @ManyToOne
    private User User;
    
    
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public Date getShowDate() {
        return showDate;
    }
    public void setShowDate(Date showDate) {
        this.showDate = showDate;
    }
    public void setSeatsList(ArrayList<Integer> seatsList) {
        this.seatsList = seatsList;
    }
    public List<Integer> getSeatsList() {
        return seatsList;
    }
    public void setSeatsList(List<Integer> bookedSeatList) {
        this.seatsList = (ArrayList<Integer>) bookedSeatList;
    }
    
    public int getUbsId() {
        return ubsId;
    }
    public void setUbsId(int ubsId) {
        this.ubsId = ubsId;
    }
    public String getShowTime() {
        return showTime;
    }
    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }
    public String getMovieName() {
        return movieName;
    }
    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }
//    public String getTheatreId() {
//        return theatreId;
//    }
//    public void setTheatreId(String string) {
//        this.theatreId = string;
//    }
    public String getTheatreName() {
        return theatreName;
    }
    public void setTheatreName(String theatreName) {
        this.theatreName = theatreName;
    }
    public String getTheatreCity() {
        return theatreCity;
    }
    public void setTheatreCity(String theatreCity) {
        this.theatreCity = theatreCity;
    }
    public int getTotalSeats() {
        return totalSeats;
    }
    public void setTotalSeats(int totalSeats) {
        this.totalSeats = totalSeats;
    }
    public int getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
    public User getUser() {
        return User;
    }
    public void setUser(User user) {
        User = user;
    }
    
    

}