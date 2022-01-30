package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stadiumbooking.daoimpl.SportsDaoImpl;
import com.stadiumbooking.model.Sports;



@WebServlet("/sports")
public class SportsController extends HttpServlet {
	final SportsDaoImpl sportsDao=new SportsDaoImpl();
	
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		/*Getting Sports Details */
		
		String sportsName=req.getParameter("sportsName");
		String eventName=req.getParameter("eventName");
		
		Sports sports=new Sports(0,sportsName,eventName);
		try {
			sportsDao.insertSports(sports);
			res.sendRedirect("sportsDetalis.jsp");
		} catch (SQLException e) {
			
			e.getMessage();
		} catch (IOException e1) {
		
			e1.getMessage();
		}
	}
	

}
