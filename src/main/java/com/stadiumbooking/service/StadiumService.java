package com.stadiumbooking.service;

import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.StadiumDetalis;

public interface StadiumService {

	public void insertStadium(StadiumDetalis stadium) throws SQLException;
	public List<StadiumDetalis> getAllStadiumList() throws  SQLException;
}
