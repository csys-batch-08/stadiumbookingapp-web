package com.stadiumbooking.service.impl;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.model.Match;
import com.stadiumbooking.service.MatchService;

public class MatchServiceImpl implements MatchService {

	static final MatchDaoImpl matchDao=new MatchDaoImpl();
	@Override
	public void insertMatchDetalis(Match match) throws SQLException {
		matchDao.insertMatchDetalis(match);
		
	}

	@Override
	public List<Match> getAllMatchDetalis() throws SQLException {
		
		return matchDao.getAllMatchDetalis();
	}

	@Override
	public void updateMatchDetails(Match match) throws SQLException {

		matchDao.updateMatchDetails(match);
		
	}

	@Override
	public LocalDate getDate() throws SQLException {

		return matchDao.getDate();
	}

	@Override
	public Match getMatchByMatchId(int matchId) throws SQLException {
		
		return matchDao.getMatchByMatchId(matchId);
	}

	@Override
	public void updateAvailableSeats(int seatsCount, int matchId) throws SQLException {
		matchDao.updateAvailableSeats(seatsCount, matchId);
		
	}

	@Override
	public void updateCancelledSeats(int seatsCount, int matchId) throws SQLException {
		matchDao.updateCancelledSeats(seatsCount, matchId);
		
	}

	@Override
	public int checkAvilableSeats(int matchId) throws SQLException {
		
		return matchDao.checkAvilableSeats(matchId);
	}

	@Override
	public List<Match> searchByTeam(String teamNmae) throws SQLException {
		
		return matchDao.searchByTeam(teamNmae);
	}

}
