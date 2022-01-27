package com.stadiumbooking.model;

import java.util.Objects;

public class Seats {
	private int ticketId;
	private int userid;
	private String ticketNumbers;
	private int matchId;

	private String seatclass;
	private int price;
	private int seatcount;
	private String status;
	public Seats() {
		super();
		
	}
	public Seats(int ticketId, int userid, String ticketNumbers, int matchId, String seatclass, int pirce,
			int seatcount, String status) {
		super();
		this.ticketId = ticketId;
		this.userid = userid;
		this.ticketNumbers = ticketNumbers;
		this.matchId = matchId;
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
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getTicketNumbers() {
		return ticketNumbers;
	}
	public void setTicketNumbers(String ticketNumbers) {
		this.ticketNumbers = ticketNumbers;
	}
	public int getMatchId() {
		return matchId;
	}
	public void setMatchId(int matchId) {
		this.matchId = matchId;
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
		return "Seats [ticketId=" + ticketId + ", userid=" + userid + ", ticketNumbers=" + ticketNumbers + ", matchId="
				+ matchId + ", seatclass=" + seatclass + ", price=" + price + ", seatcount=" + seatcount + ", status="
				+ status + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(price, seatclass, seatcount, ticketId, ticketNumbers, userid);
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
				&& userid == other.userid;
	}
	
	
	
	

}
