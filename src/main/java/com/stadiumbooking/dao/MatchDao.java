package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import com.stadiumbooking.model.Match;

public interface MatchDao {
	
	public void insertMatchDetalis(Match match) throws ClassNotFoundException, SQLException;
	public List<Match> getAllMatchDetalis() throws ClassNotFoundException, SQLException;
	public void updateMatchDetails(Match match) throws ClassNotFoundException, SQLException;
	public LocalDate getDate() throws ClassNotFoundException, SQLException;
	public List<Match> getMatchByMatchId(int matchId) throws ClassNotFoundException, SQLException;
	public void updateAvailableSeats(int seatsCount, int matchId) throws ClassNotFoundException, SQLException;
	public void updateCancelledSeats(int seatsCount,int matchId) throws ClassNotFoundException, SQLException;

	public int checkAvilableSeats(int matchId) throws ClassNotFoundException, SQLException;
	public List<Match> searchByTeam(String teamNmae) throws ClassNotFoundException, SQLException;
}
