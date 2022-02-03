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


import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.model.Match;

@WebServlet("/bookSeats")
public class SelectMatchController extends HttpServlet {

	static final MatchDaoImpl matchDao=new MatchDaoImpl();
	
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
	
		
		
		int matchId=Integer.parseInt(req.getParameter("matchId"));
		try {
			
			Match match = matchDao.getMatchByMatchId(matchId);
			req.setAttribute("match", match);//MATCH_DETAILS
			RequestDispatcher rd = req.getRequestDispatcher("seats.jsp");			
			rd.forward(req, res);
		
		} catch (SQLException e) {
			
			e.getMessage();
		} catch (IOException e1) {
			e1.getMessage();
		} catch (ServletException e2) {

			e2.getMessage();
		}
	}
}
