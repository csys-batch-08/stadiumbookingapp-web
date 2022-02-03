package com.stadiumbooking.model;

import java.util.Objects;

public class Seats {
	private int ticketId;
	private User user;
	private String ticketNumbers;
	private Match match;

	private String seatclass;
	private int price;
	private int seatcount;
	private String status;
	public Seats() {
		super();
		
	}
	public Seats(int ticketId, User user, String ticketNumbers, Match match, String seatclass, int pirce,
			int seatcount, String status) {
		super();
		this.ticketId = ticketId;
		this.user = user;
		this.ticketNumbers = ticketNumbers;
		this.match = match;
		this.seatclass = seatclass;
		this.price = pirce;
		this.seatcount = seatcount;
		this.status = status;
	}
	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public User getUser() {
		return user;
	}
	public void setUserid(User user) {
		this.user = user;
	}
	public String getTicketNumbers() {
		return ticketNumbers;
	}
	public void setTicketNumbers(String ticketNumbers) {
		this.ticketNumbers = ticketNumbers;
	}
	public Match getMatch() {
		return match;
	}
	public void setMatchId(Match match) {
		this.match = match;
	}
	public String getSeatclass() {
		return seatclass;
	}
	public void setSeatclass(String seatclass) {
		this.seatclass = seatclass;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price= price;
	}
	public int getSeatcount() {
		return seatcount;
	}
	public void setSeatcount(int seatcount) {
		this.seatcount = seatcount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Seats [ticketId=" + ticketId + ", user=" + user + ", ticketNumbers=" + ticketNumbers + ", match="
				+ match + ", seatclass=" + seatclass + ", price=" + price + ", seatcount=" + seatcount + ", status="
				+ status + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(price, seatclass, seatcount, ticketId, ticketNumbers, user);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Seats other = (Seats) obj;
		return price== other.price&& Objects.equals(seatclass, other.seatclass) && seatcount == other.seatcount
				&& ticketId == other.ticketId && Objects.equals(ticketNumbers, other.ticketNumbers)
				&& user == other.user;
	}
	
	
	
	

}
