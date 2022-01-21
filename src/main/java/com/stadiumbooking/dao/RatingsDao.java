package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.model.Ratings;

public interface RatingsDao {
	public void ratingStadium(Ratings ratings) throws ClassNotFoundException, SQLException;
	public ResultSet getAllRatingsById(int stadium_id) throws ClassNotFoundException, SQLException;
	public ResultSet getAllRatings() throws ClassNotFoundException, SQLException;

}
