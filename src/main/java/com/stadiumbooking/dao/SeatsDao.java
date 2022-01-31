package com.stadiumbooking.dao;


import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.Seats;

public interface SeatsDao {
	public void bookingSeats(Seats seats) throws  SQLException;
	public List<Seats> getSeatById(int userId) throws  SQLException;
	public List<Seats> getSeatsDetalis() throws  SQLException;
	public void cancelledSeats(int ticketId) throws  SQLException; 
	public void updateSeatsAndRefund(int ticketId) throws SQLException; 

}
