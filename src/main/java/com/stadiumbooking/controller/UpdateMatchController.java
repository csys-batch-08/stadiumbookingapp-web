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

import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Match;
import com.stadiumbooking.service.impl.MatchServiceImpl;

@WebServlet("/updateMatch")
public class UpdateMatchController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final MatchServiceImpl matchService=new MatchServiceImpl();
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		int matchId=Integer.parseInt(req.getParameter("matchId"));
		String dateInString =req.getParameter("matchDate");
		String timeInString=req.getParameter("matchTime");
		
		LocalDate date = LocalDate.parse(dateInString);
		LocalTime time=LocalTime.parse(timeInString);
		
		Match match=new Match(matchId,0,null,null,date,time,null,null,null,null,0,0,0,0);
		
		try {
		
			matchService.updateMatchDetails(match);
			List<Match> matchDetails=matchService.getAllMatchDetalis();
			req.setAttribute("MatchDetails", matchDetails);
			 RequestDispatcher rd = req.getRequestDispatcher("showMatchToAdmin.jsp");
				rd.forward(req, res);
		} catch (IOException e) {
		
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		} catch (SQLException e2) {
			
			Logger.printStackTrace(e2);
			Logger.runTimeException(e2.getMessage());
		} catch (ServletException e3) {
			
			Logger.printStackTrace(e3);
			Logger.runTimeException(e3.getMessage());
		}
		
		
	}
}
