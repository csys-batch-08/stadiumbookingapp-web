package com.stadiumbooking.model;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.Objects;

public class Match {

	private int matchId;
	private int sportsId;
	private String stadiumName;
	private String location;
	private LocalDate matchDate; 
	private LocalTime matchTime;
	private  String teamA;
	private  String teamB;
	private String teamAlogo;
	private String teamBlogo;
	private int totalseats;
	private int availableSeats;
	private int firstClassSeatsPrice;
	private int secondClassSeatsPrice;
	
	
	
	public Match() {
		super();
	
	}


	public Match(int matchId,int sportsId, String stadiumName, String location, LocalDate date,LocalTime matchTime, String teamA, String teamB,
			String teamAlogo, String teamBlogo, int totalseats, int availableSeats, int firstClassSeatsPrice,
			int secondClassSeatsPrice) {
		super();
		this.matchId=matchId;
		this.sportsId = sportsId;
		this.stadiumName = stadiumName;
		this.location = location;
		this.matchDate = date;
		this.matchTime=matchTime;
		this.teamA = teamA;
		this.teamB = teamB;
		this.teamAlogo = teamAlogo;
		this.teamBlogo = teamBlogo;
		this.totalseats = totalseats;
		this.availableSeats = availableSeats;
		this.firstClassSeatsPrice = firstClassSeatsPrice;
		this.secondClassSeatsPrice = secondClassSeatsPrice;
	}

	public int getMatchId() {
		return matchId;
	}



	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}



	public int getSportsId() {
		return sportsId;
	}



	public void setSportsId(int sportsId) {
		this.sportsId = sportsId;
	}



	public String getStadiumName() {
		return stadiumName;
	}



	public void setStadiumName(String stadiumName) {
		this.stadiumName = stadiumName;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public LocalDate getMatchDate() {
		return matchDate;
	}



	public void setMatchDate(LocalDate matchDate) {
		this.matchDate = matchDate;
	}



	public String getTeamA() {
		return teamA;
	}



	public void setTeamA(String teamA) {
		this.teamA = teamA;
	}



	public String getTeamB() {
		return teamB;
	}



	public void setTeamB(String teamB) {
		this.teamB = teamB;
	}



	public String getTeamAlogo() {
		return teamAlogo;
	}



	public void setTeamAlogo(String teamAlogo) {
		this.teamAlogo = teamAlogo;
	}



	public String getTeamBlogo() {
		return teamBlogo;
	}



	public void setTeamBlogo(String teamBlogo) {
		this.teamBlogo = teamBlogo;
	}



	public int getTotalseats() {
		return totalseats;
	}



	public void setTotalseats(int totalseats) {
		this.totalseats = totalseats;
	}



	public int getAvailableSeats() {
		return availableSeats;
	}



	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}



	public int getFirstClassSeatsPrice() {
		return firstClassSeatsPrice;
	}



	public void setFirstClassSeatsPrice(int firstClassSeatsPrice) {
		this.firstClassSeatsPrice = firstClassSeatsPrice;
	}



	public int getSecondClassSeatsPrice() {
		return secondClassSeatsPrice;
	}



	public void setSecondClassSeatsPrice(int secondClassSeatsPrice) {
		this.secondClassSeatsPrice = secondClassSeatsPrice;
	}



	public LocalTime getMatchTime() {
		return matchTime;
	}



	public void setMatchTime(LocalTime matchTime) {
		this.matchTime = matchTime;
	}



	@Override
	public String toString() {
		return "Match [match_id=" + matchId + ", sportsId=" + sportsId + ", stadium_name=" + stadiumName
				+ ", location=" + location + ", match_date=" + matchDate + ", match_time=" + matchTime + ", teamA="
				+ teamA + ", teamB=" + teamB + ", teamAlogo=" + teamAlogo + ", teamBlogo=" + teamBlogo + ", totalseats="
				+ totalseats + ", availableSeats=" + availableSeats + ", firstClass_Seats_price="
				+ firstClassSeatsPrice + ", secondClass_seats_price=" + secondClassSeatsPrice + "]";
	}



	@Override
	public int hashCode() {
		return Objects.hash(location, matchDate, matchTime, teamA, teamB);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Match other = (Match) obj;
		return Objects.equals(location, other.location) && Objects.equals(matchDate, other.matchDate)
				&& Objects.equals(matchTime, other.matchTime) && Objects.equals(teamA, other.teamA)
				&& Objects.equals(teamB, other.teamB);
	}
	
	
	
	
	
	
}
