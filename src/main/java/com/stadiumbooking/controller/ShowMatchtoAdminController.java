package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.model.Match;

@WebServlet("/showMatchToAdmin")
public class ShowMatchtoAdminController extends HttpServlet {
	final MatchDaoImpl matchDao=new MatchDaoImpl();
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res)  {
		
		List<Match> matchDetails;
		try {
			matchDetails = matchDao.getAllMatchDetalis();
			req.setAttribute("MatchDetails", matchDetails);
			
		
			 RequestDispatcher rd = req.getRequestDispatcher("showMatchToAdmin.jsp");
				rd.forward(req, res);
		} catch (ClassNotFoundException | SQLException | ServletException | IOException e) {
	
			e.printStackTrace();
		}
	
		
	}

}
