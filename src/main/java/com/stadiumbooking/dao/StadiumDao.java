package com.stadiumbooking.dao;


import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.StadiumDetalis;

public interface StadiumDao {

	public void insertStadium(StadiumDetalis stadium) throws SQLException;
	public List<StadiumDetalis> getAllStadiumList() throws  SQLException;
}
