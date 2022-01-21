package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.model.Sports;

public interface SportsDao {
	
	public void insertSports(Sports sports) throws ClassNotFoundException, SQLException;
	public int getSportsId(String sportsName,String eventName) throws ClassNotFoundException, SQLException;

	public ResultSet getAllSports() throws ClassNotFoundException, SQLException;
}
