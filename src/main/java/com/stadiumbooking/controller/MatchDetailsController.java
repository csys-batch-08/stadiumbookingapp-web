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


import com.stadiumbooking.daoimpl.SportsDaoImpl;
import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.model.Sports;
import com.stadiumbooking.model.StadiumDetalis;

@WebServlet("/matchDetails")
public class MatchDetailsController extends HttpServlet {

	final SportsDaoImpl sportDao=new SportsDaoImpl();
	final StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res)  {
		
	
		try {
			   List<Sports> sportsList=sportDao.getAllSports();
			   List<StadiumDetalis> stadiumList=stadiumDao.getAllStadiumList();
				req.setAttribute("stadiumList", stadiumList);
			    req.setAttribute("sportsList", sportsList);
			
			 RequestDispatcher rd = req.getRequestDispatcher("matchDetails.jsp");
				rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
	
			e.getMessage();
		}
	
		
	}

}
