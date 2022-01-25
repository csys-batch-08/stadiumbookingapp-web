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

@WebServlet("/searchedMatchDetails")
public class SearchController  extends HttpServlet{

	MatchDaoImpl matchDao=new MatchDaoImpl();
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		String teamName=req.getParameter("teamName");
		//System.out.println(teamName);
		HttpSession session=req.getSession();
		try {
			List<Match> matchDetails=matchDao.searchByTeam(teamName);
			//System.out.println(matchDetails.size());
			session.setAttribute("searchMatchList", matchDetails);
			res.sendRedirect("searchedMatchDetails.jsp");
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
