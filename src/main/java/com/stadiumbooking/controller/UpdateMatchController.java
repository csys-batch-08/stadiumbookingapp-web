package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.model.Match;

@WebServlet("/updateMatch")
public class UpdateMatchController extends HttpServlet {

	final MatchDaoImpl matchDao=new MatchDaoImpl();
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		int matchId=Integer.parseInt(req.getParameter("matchId"));
		String dateInString =req.getParameter("matchDate");
		String timeInString=req.getParameter("matchTime");
		
		LocalDate date = LocalDate.parse(dateInString);
		LocalTime time=LocalTime.parse(timeInString);
		
		Match match=new Match(matchId,0,null,null,date,time,null,null,null,null,0,0,0,0);
		
		try {
		
			matchDao.updateMatchDetails(match);
			List<Match> matchDetails=matchDao.getAllMatchDetalis();
			req.setAttribute("MatchDetails", matchDetails);
			 RequestDispatcher rd = req.getRequestDispatcher("showMatchToAdmin.jsp");
				rd.forward(req, res);
		} catch (IOException e) {
		
			e.getMessage();
		} catch (SQLException e2) {
			
			e2.getMessage();
		} catch (ServletException e3) {
			
			e3.getMessage();
		}
		
		
	}
}
