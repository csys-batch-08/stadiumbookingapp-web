package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stadiumbooking.daoimpl.SportsDaoImpl;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Sports;
import com.stadiumbooking.service.impl.SportsServiceImpl;



@WebServlet("/sports")
public class SportsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final SportsServiceImpl sportsService=new SportsServiceImpl();
	
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		/*Getting Sports Details */
		
		String sportsName=req.getParameter("sportsName");
		String eventName=req.getParameter("eventName");
		
		Sports sports=new Sports(0,sportsName,eventName);
		try {
			sportsService.insertSports(sports);
			res.sendRedirect("sportsDetalis.jsp");
		} catch (SQLException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		} catch (IOException e1) {
		
			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		}
	}
	

}
