package com.stadiumbooking.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.daoimpl.SportsDaoImpl;
import com.stadiumbooking.model.Sports;
import com.stadiumbooking.service.SportsService;

public class SportsServiceImpl implements SportsService{

	static final SportsDaoImpl sportsDao=new SportsDaoImpl();
	@Override
	public void insertSports(Sports sports) throws SQLException {
		sportsDao.insertSports(sports);
	}

	@Override
	public int getSportsId(String sportsName, String eventName) throws SQLException {
		
		return sportsDao.getSportsId(sportsName, eventName);
	}

	@Override
	public List<Sports> getAllSports() throws SQLException {
	
		return sportsDao.getAllSports();
	}

}
