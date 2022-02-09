package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Seats;
import com.stadiumbooking.service.impl.SeatsServiceImpl;


@WebServlet("/allBookingDetails")
public class AllBookingDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final SeatsServiceImpl seatsService=new SeatsServiceImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		try {
		    List<Seats> seatList=seatsService.getSeatsDetalis();
			 
		    req.setAttribute("seatList", seatList);
		
		      RequestDispatcher rd = req.getRequestDispatcher("allBookingDetails.jsp");			
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
		
	
	}

}
