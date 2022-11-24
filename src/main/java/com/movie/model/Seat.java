package com.movie.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Seat {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int seatId;
	private int seatIndex;
	private int seatNo;
	
	@ManyToOne
	private Show show;
	
	public Seat() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Show getShow() {
		return show;
	}

	public void setShow(Show show) {
		this.show = show;
	}

	public Seat(int index, int seatNo) {
		super();
		this.seatIndex = index;
		this.seatNo = seatNo;
	}
	public Seat(int seatNo) {
		super();
		this.seatNo = seatNo;
	}
	
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public int getSeatIndex() {
		return seatIndex;
	}
	public void setSeatIndex(int seatIndex) {
		this.seatIndex = seatIndex;
	}
	public int getIndex() {
		return seatIndex;
	}
	public void setIndex(int index) {
		this.seatIndex = index;
	}
	public int getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}
	
}