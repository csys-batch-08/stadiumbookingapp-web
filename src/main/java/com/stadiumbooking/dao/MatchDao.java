package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.Match;

public interface MatchDao {
	
	public void insertMatchDetalis(Match match) throws ClassNotFoundException, SQLException;
	public ResultSet getAllMatchDetalis() throws ClassNotFoundException, SQLException;
	public void updateMatchDetails(Match match) throws ClassNotFoundException, SQLException;
	public ResultSet getDate() throws ClassNotFoundException, SQLException;
	public ResultSet getMatchByMatchId(int matchId) throws ClassNotFoundException, SQLException;
	public void updateAvailableSeats(int seatsCount, int matchId) throws ClassNotFoundException, SQLException;
	public void updateCancelledSeats(int seatsCount,int matchId) throws ClassNotFoundException, SQLException;

	public int checkAvilableSeats(int matchId) throws ClassNotFoundException, SQLException;
	public ResultSet searchByTeam(String teamNmae) throws ClassNotFoundException, SQLException;
}
