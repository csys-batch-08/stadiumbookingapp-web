package com.stadiumbooking.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.dao.RatingsDao;
import com.stadiumbooking.daoimpl.RatingsDaoImpl;
import com.stadiumbooking.model.Ratings;

public class RatingsServiceImpl implements RatingsDao {

	static final RatingsDaoImpl ratingDao=new RatingsDaoImpl();
	@Override
	public void ratingStadium(Ratings ratings) throws SQLException {
		ratingDao.ratingStadium(ratings);		
	}

	@Override
	public List<Ratings> getAllRatingsById(int stadiumId) throws SQLException {

		return ratingDao.getAllRatingsById(stadiumId);
	}

	@Override
	public List<Ratings> getAllRatings() throws SQLException {

		return ratingDao.getAllRatings();
	}

}
