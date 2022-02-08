package com.stadiumbooking.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.daoimpl.SeatsDaoImpl;
import com.stadiumbooking.model.Seats;
import com.stadiumbooking.service.SeatsService;

public class SeatsServiceImpl implements SeatsService {

	static final SeatsDaoImpl seatsDao=new SeatsDaoImpl();
	@Override
	public void bookingSeats(Seats seats) throws SQLException {
		seatsDao.bookingSeats(seats);
		
	}

	@Override
	public List<Seats> getSeatById(int userId) throws SQLException {
		
		return seatsDao.getSeatById(userId);
	}

	@Override
	public List<Seats> getSeatsDetalis() throws SQLException {
				return seatsDao.getSeatsDetalis();
	}

	@Override
	public int cancelledSeats(int ticketId) throws SQLException {
		
		return seatsDao.cancelledSeats(ticketId);
	}

	@Override
	public void updateSeatsAndRefund(int ticketId) throws SQLException {
		seatsDao.updateSeatsAndRefund(ticketId);
		
	}

}
