package com.stadiumbooking.model;

import java.util.Objects;

public class Seats {
	private int ticketId;
	private int userid;
	private String ticket_numbers;
	private int match_id;
	private int sportsId;
	private String seatclass;
	private int Totalpirce;
	private int seatcount;
	private String status;
	public Seats() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Seats( int userid, String ticket_numbers, int match_id, String seatclass,
			int totalpirce, int seatcount) {
		super();
		
		this.userid = userid;
		this.ticket_numbers = ticket_numbers;
		this.match_id = match_id;
		
		this.seatclass = seatclass;
		Totalpirce = totalpirce;
		this.seatcount = seatcount;
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
	public String getTicket_numbers() {
		return ticket_numbers;
	}
	public void setTicket_numbers(String ticket_numbers) {
		this.ticket_numbers = ticket_numbers;
	}
	public int getMatch_id() {
		return match_id;
	}
	public void setMatch_id(int match_id) {
		this.match_id = match_id;
	}
	public int getSportsId() {
		return sportsId;
	}
	public void setSportsId(int sportsId) {
		this.sportsId = sportsId;
	}
	public String getSeatclass() {
		return seatclass;
	}
	public void setSeatclass(String seatclass) {
		this.seatclass = seatclass;
	}
	public int getTotalpirce() {
		return Totalpirce;
	}
	public void setTotalpirce(int totalpirce) {
		Totalpirce = totalpirce;
	}
	public int getSeatcount() {
		return seatcount;
	}
	public void setSeatcount(int seatcount) {
		this.seatcount = seatcount;
	}
	@Override
	public String toString() {
		return "Seats [ticketId=" + ticketId + ", userid=" + userid + ", ticket_numbers=" + ticket_numbers
				+ ", match_id=" + match_id + ", sportsId=" + sportsId + ", seatclass=" + seatclass + ", Totalpirce="
				+ Totalpirce + ", seatcount=" + seatcount + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(seatclass, seatcount, ticketId, ticket_numbers);
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
		return Objects.equals(seatclass, other.seatclass) && seatcount == other.seatcount && ticketId == other.ticketId
				&& Objects.equals(ticket_numbers, other.ticket_numbers);
	}
	
	

}
