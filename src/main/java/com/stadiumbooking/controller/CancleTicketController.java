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
import javax.servlet.http.HttpSession;

import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Seats;
import com.stadiumbooking.service.impl.MatchServiceImpl;
import com.stadiumbooking.service.impl.SeatsServiceImpl;
import com.stadiumbooking.service.impl.UserServiceImpl;

@WebServlet("/cancleTicket")
public class CancleTicketController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	static final MatchServiceImpl matchService=new MatchServiceImpl();
	static final SeatsServiceImpl seatService=new SeatsServiceImpl();
	static final UserServiceImpl userService=new UserServiceImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {
	
		HttpSession session=req.getSession();
		
		try {
			int ticketId=Integer.parseInt(req.getParameter("ticketId"));
			int userID=(int) session.getAttribute("id");
			int row=seatService.cancelledSeats(ticketId);
			if(row==1) {
			seatService.updateSeatsAndRefund(ticketId);
			List<Seats> seatListById=seatService.getSeatById(userID);
			req.setAttribute("seatListById", seatListById);
			req.setAttribute("cancel","Cancelled");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/mymatch.jsp");

			rd.forward(req, res);
			}		
		} catch (SQLException | IOException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		} catch (ServletException e1) {
			
			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		}
	
	}

}
