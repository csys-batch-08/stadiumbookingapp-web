package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.Ratings;

public interface RatingsDao {
	public void ratingStadium(Ratings ratings) throws ClassNotFoundException, SQLException;
	public List<Ratings> getAllRatingsById(int stadium_id) throws ClassNotFoundException, SQLException;
	public List<Ratings> getAllRatings() throws ClassNotFoundException, SQLException;

}
