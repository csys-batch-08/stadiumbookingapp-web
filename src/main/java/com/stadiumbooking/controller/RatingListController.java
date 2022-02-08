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

import com.stadiumbooking.daoimpl.RatingsDaoImpl;
import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.StadiumDetalis;
import com.stadiumbooking.service.impl.RatingsServiceImpl;
import com.stadiumbooking.service.impl.StadiumServiceImpl;

@WebServlet("/ratingList")
public class RatingListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final StadiumServiceImpl stadiumService=new StadiumServiceImpl();
	final RatingsServiceImpl ratingService=new RatingsServiceImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		try {
			List<StadiumDetalis> stadiumList=stadiumService.getAllStadiumList();
			req.setAttribute("stadiumList", stadiumList);
		
		      RequestDispatcher rd = req.getRequestDispatcher("ratingList.jsp");			
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
		
	
	}

}
