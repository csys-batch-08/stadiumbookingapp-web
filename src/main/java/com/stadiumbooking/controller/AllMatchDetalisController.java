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
@WebServlet("/allMatchDetalis")
public class AllMatchDetalisController extends HttpServlet {
	final MatchDaoImpl matchDao=new MatchDaoImpl();
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res)  {
		
		List<Match> matchDetails;
		try {
			matchDetails = matchDao.getAllMatchDetalis();
			req.setAttribute("MatchDetails", matchDetails);
			
		
			 RequestDispatcher rd = req.getRequestDispatcher("allMatchDetalis.jsp");
				rd.forward(req, res);
		} catch (ClassNotFoundException | SQLException | ServletException | IOException e) {
	
			e.printStackTrace();
		}
	
		
	}

}
