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

import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.model.StadiumDetalis;


@WebServlet("/ratingStadium")
public class RatingStadiumController extends HttpServlet {

	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {

		int stadiumId=Integer.parseInt(req.getParameter("stadiumId"));
		
		try {
			req.setAttribute("stadiumID", stadiumId);
		      RequestDispatcher rd = req.getRequestDispatcher("rating.jsp");			
					rd.forward(req, res);
		} catch (ServletException | IOException |NumberFormatException  e1) {
			
			  req.getRequestDispatcher("index.jsp");
		}
		
	
	}

}
