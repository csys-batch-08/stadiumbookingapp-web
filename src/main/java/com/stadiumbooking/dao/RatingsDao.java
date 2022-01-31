package com.stadiumbooking.dao;


import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.Ratings;

public interface RatingsDao {
	public void ratingStadium(Ratings ratings) throws SQLException;
	public List<Ratings> getAllRatingsById(int stadiumId) throws  SQLException;
	public List<Ratings> getAllRatings() throws  SQLException;

}
