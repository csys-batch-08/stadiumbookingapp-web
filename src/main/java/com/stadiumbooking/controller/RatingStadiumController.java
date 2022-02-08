package com.stadiumbooking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stadiumbooking.logger.Logger;



@WebServlet("/ratingStadium")
public class RatingStadiumController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {

		
		
		try {int stadiumId=Integer.parseInt(req.getParameter("stadiumId"));
			req.setAttribute("stadiumID", stadiumId);
		      RequestDispatcher rd = req.getRequestDispatcher("rating.jsp");			
					rd.forward(req, res);
		} catch (ServletException | IOException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}catch(NumberFormatException  e1) {
			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		}
		
	
	}

}
