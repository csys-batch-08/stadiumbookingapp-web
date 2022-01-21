package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.model.Match;

@WebServlet("/updateMatch")
public class UpdateMatchController extends HttpServlet {

	MatchDaoImpl matchDao=new MatchDaoImpl();
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		int matchId=Integer.parseInt(req.getParameter("matchId"));
		String dateInString =req.getParameter("matchDate");
		String timeInString=req.getParameter("matchTime");
		//System.out.println(timeInString);
		LocalDate date = LocalDate.parse(dateInString);
		LocalTime time=LocalTime.parse(timeInString);
		//System.out.println(time);
		Match match=new Match(matchId,date,time);
		try {
			matchDao.updateMatchDetails(match);
			res.sendRedirect("showMatchToAdmin.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
