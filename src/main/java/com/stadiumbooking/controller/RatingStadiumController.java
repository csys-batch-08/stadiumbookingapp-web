package com.stadiumbooking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/ratingStadium")
public class RatingStadiumController extends HttpServlet {

	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {

		
		
		try {int stadiumId=Integer.parseInt(req.getParameter("stadiumId"));
			req.setAttribute("stadiumID", stadiumId);
		      RequestDispatcher rd = req.getRequestDispatcher("rating.jsp");			
					rd.forward(req, res);
		} catch (ServletException | IOException e) {
			
			e.getMessage();
		}catch(NumberFormatException  e1) {
			e1.getMessage();
		}
		
	
	}

}
