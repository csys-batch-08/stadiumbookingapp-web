package com.stadiumbooking.dao;


import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import com.stadiumbooking.model.Match;

public interface MatchDao {
	
	public void insertMatchDetalis(Match match) throws SQLException;
	public List<Match> getAllMatchDetalis() throws  SQLException;
	public void updateMatchDetails(Match match) throws  SQLException;
	public LocalDate getDate() throws  SQLException;
	public Match getMatchByMatchId(int matchId) throws SQLException;
	public void updateAvailableSeats(int seatsCount, int matchId) throws SQLException;
	public void updateCancelledSeats(int seatsCount,int matchId) throws  SQLException;

	public int checkAvilableSeats(int matchId) throws  SQLException;
	public List<Match> searchByTeam(String teamNmae) throws SQLException;
}
