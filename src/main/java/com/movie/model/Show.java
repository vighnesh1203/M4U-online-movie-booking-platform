package com.movie.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.movie.sequenceGenerator.StringPrefixedSequenceIdGenerator;

@Entity
@Table(name = "Show1")
public class Show {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Sh_seq")
	@GenericGenerator(name = "Sh_seq", strategy = "com.movie.sequenceGenerator.StringPrefixedSequenceIdGenerator", parameters = {
			@Parameter(name = StringPrefixedSequenceIdGenerator.INCREMENT_PARAM, value = "1"),
			@Parameter(name = StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER, value = "SHOW"),
			@Parameter(name = StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER, value = "%02d") })
	private String shId;
//	@NotNull
	private String shTime;
	private int costOfTicket;
	private Date showDate;
	
	@ManyToOne
	private Theatre theatre;
	
	@ManyToOne
	private Movie movie;
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Seat> seat;
	
	public String getShId() {
		return shId;
	}
	public void setShId(String shId) {
		this.shId = shId;
	}
	public String getShTime() {
		return shTime;
	}
	public void setShTime(String shTime) {
		this.shTime = shTime;
	}
	public int getCostOfTicket() {
		return costOfTicket;
	}
	public void setCostOfTicket(int costOfTicket) {
		this.costOfTicket = costOfTicket;
	}
	public Date getShowDate() {
		return showDate;
	}
	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}
	public Theatre getTheatre() {
		return theatre;
	}
	public void setTheatre(Theatre theatre) {
		this.theatre = theatre;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public List<Seat> getSeat() {
		return seat;
	}
	public void setSeat(List<Seat> seat) {
		this.seat = seat;
	}
}
