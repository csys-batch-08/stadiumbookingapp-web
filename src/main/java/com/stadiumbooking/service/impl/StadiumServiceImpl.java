package com.stadiumbooking.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.model.StadiumDetalis;
import com.stadiumbooking.service.StadiumService;

public class StadiumServiceImpl implements StadiumService {
	static final StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
	@Override
	public void insertStadium(StadiumDetalis stadium) throws SQLException {
	
	stadiumDao.insertStadium(stadium);	
	}

	@Override
	public List<StadiumDetalis> getAllStadiumList() throws SQLException {
		
		return stadiumDao.getAllStadiumList();
	}

}
