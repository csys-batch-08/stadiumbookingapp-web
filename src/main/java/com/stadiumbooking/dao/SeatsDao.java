package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.Seats;

public interface SeatsDao {
	public void bookingSeats(Seats seats) throws ClassNotFoundException, SQLException;
	public List<Seats> getSeatById(int userId) throws ClassNotFoundException, SQLException;
	public List<Seats> getSeatsDetalis() throws ClassNotFoundException, SQLException;
	public void cancelledSeats(int TicketId) throws ClassNotFoundException, SQLException; 

}
