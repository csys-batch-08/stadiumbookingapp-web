package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.Sports;

public interface SportsDao {
	
	public void insertSports(Sports sports) throws ClassNotFoundException, SQLException;
	public int getSportsId(String sportsName,String eventName) throws ClassNotFoundException, SQLException;

	public List<Sports> getAllSports() throws ClassNotFoundException, SQLException;
}
