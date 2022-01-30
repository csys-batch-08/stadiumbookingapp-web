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

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.daoimpl.SeatsDaoImpl;
import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.model.Match;
import com.stadiumbooking.model.Seats;

@WebServlet("/cancleTicket")
public class CancleTicketController extends HttpServlet {
	
	final MatchDaoImpl matchDao=new MatchDaoImpl();
	final SeatsDaoImpl seatDao=new SeatsDaoImpl();
	final UserDaoImpl userDao=new UserDaoImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {
	
		HttpSession session=req.getSession();
		
		try {
			int ticketId=Integer.parseInt(req.getParameter("ticketId"));
			int userID=(int) session.getAttribute("id");
			seatDao.cancelledSeats(ticketId);
			List<Seats> seatListById=seatDao.getSeatById(userID);
			req.setAttribute("seatListById", seatListById);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/mymatch.jsp");

			rd.forward(req, res);
		
		} catch (SQLException | IOException e) {
			
			e.getMessage();
		} catch (ServletException e1) {
			
			e1.getMessage();
		}
	
	}

}
