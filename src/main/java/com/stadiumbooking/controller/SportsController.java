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
	SportsDaoImpl sportsDao=new SportsDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		/*Getting Sports Details */
		
		String sportsName=req.getParameter("sportsName");
		String eventName=req.getParameter("eventName");
		
		Sports sports=new Sports(sportsName,eventName);
		try {
			sportsDao.insertSports(sports);
			res.sendRedirect("sportsDetalis.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
