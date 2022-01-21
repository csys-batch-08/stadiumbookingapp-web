package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.model.Stadium_detalis;

public interface StadiumDao {

	public void insertStadium(Stadium_detalis stadium);
	public ResultSet getAllStadiumList() throws ClassNotFoundException, SQLException;
}
