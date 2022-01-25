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
import com.stadiumbooking.model.Match;

@WebServlet("/bookSeats")
public class SelectMatchController extends HttpServlet {

	MatchDaoImpl matchDao=new MatchDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
	
		HttpSession sessions=req.getSession();
		
		int matchId=Integer.parseInt(req.getParameter("matchId"));
		try {
			
			List<Match> match = matchDao.getMatchByMatchId(matchId);
			sessions.setAttribute("singleMatch", match);
			res.sendRedirect("seats.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
