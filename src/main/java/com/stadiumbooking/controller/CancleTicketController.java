package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
	
	MatchDaoImpl matchDao=new MatchDaoImpl();
	SeatsDaoImpl seatDao=new SeatsDaoImpl();
	UserDaoImpl userDao=new UserDaoImpl();
	public void doGet(HttpServletRequest req, HttpServletResponse res) {
	
		HttpSession session=req.getSession();
		int ticketId=Integer.parseInt(req.getParameter("ticketId"));
		int userID=(int) session.getAttribute("id");
		try {
		
			seatDao.cancelledSeats(ticketId);
			List<Match> matchDetails=matchDao.getAllMatchDetalis();
			session.setAttribute("MatchDetails", matchDetails);
			List<Seats> seatListById=seatDao.getSeatById(userID);
			Double Wallet=userDao.userWalletDetails(userID);
			//System.out.println(wallet);
			session.setAttribute("wallet", Wallet);
			session.setAttribute("seatListById", seatListById);
			res.sendRedirect("mymatch.jsp");
		
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
