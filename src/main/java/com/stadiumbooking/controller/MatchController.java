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
import com.stadiumbooking.service.impl.SportsServiceImpl;


@WebServlet("/matchServe")
public class MatchController  extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	static final MatchServiceImpl matchService=new MatchServiceImpl();
	static final SportsServiceImpl sportsService=new SportsServiceImpl();
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {
	
		/*  Getting Macth Details */

		String stdName=req.getParameter("stdname").trim();
	
		String location=req.getParameter("location");
		
		String sportsName=req.getParameter("spname");
		
		String eventName=req.getParameter("event");
		
		int spid = 0;
		try {
			spid = sportsService.getSportsId(sportsName, eventName);
		} catch (SQLException e2) {
			
			Logger.printStackTrace(e2);
			Logger.runTimeException(e2.getMessage());
		}
		
				
	    
	
		String teamA=req.getParameter("teamA");
       
         String teamB=req.getParameter("teamB");
         
		String teamAlogo=req.getParameter("teamAlogo");
		String teamBlogo=req.getParameter("teamBlogo");
		
		int totalseats=Integer.parseInt(req.getParameter("totalSeats"));
		
		int availSeats=Integer.parseInt(req.getParameter("availseats"));
		
		int fClass=Integer.parseInt(req.getParameter("firstClass"));
		
		int sClass=Integer.parseInt(req.getParameter("secondClass" ));
	      String dateInString = req.getParameter("matchDate");
		
		try {
				LocalDate date = LocalDate.parse(dateInString);
					String timeInString=req.getParameter("time");
			LocalTime time=LocalTime.parse(timeInString);
			Match match=new Match();
			
			match.setSportsId(spid);
			match.setStadiumName(stdName);
			match.setLocation(location);
			match.setMatchDate(date);
			match.setMatchTime(time);
			match.setTeamA(teamA);
			match.setTeamB(teamB);
			match.setTeamAlogo(teamAlogo);
			match.setTeamBlogo(teamBlogo);
			match.setTotalseats(totalseats);
			match.setAvailableSeats(availSeats);
			match.setFirstClassSeatsPrice(fClass);
			match.setSecondClassSeatsPrice(sClass);
			
			matchService.insertMatchDetalis(match);
			List<Match> matchDetails = matchService.getAllMatchDetalis();
			req.setAttribute("MatchDetails", matchDetails);
			 RequestDispatcher rd = req.getRequestDispatcher("showMatchToAdmin.jsp");
				rd.forward(req, res);
		} catch (SQLException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		} catch (IOException e2) {
			
			Logger.printStackTrace(e2);
			Logger.runTimeException(e2.getMessage());
		} catch (ServletException e1) {
			
			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		}
	}
	

}
