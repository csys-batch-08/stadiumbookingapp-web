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
import com.stadiumbooking.model.Match;

@WebServlet("/searchedMatchDetails")
public class SearchController  extends HttpServlet{

	final MatchDaoImpl matchDao=new MatchDaoImpl();
	@Override
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		String teamName=req.getParameter("teamName");
		
		try {
			List<Match> matchDetails=matchDao.searchByTeam(teamName);
			req.setAttribute("searchMatchList", matchDetails);
			RequestDispatcher rd = req.getRequestDispatcher("searchedMatchDetails.jsp");			
				rd.forward(req, res);
			

		} catch (SQLException | IOException | ServletException e) {
			e.getMessage();
		}
		
	}
}
