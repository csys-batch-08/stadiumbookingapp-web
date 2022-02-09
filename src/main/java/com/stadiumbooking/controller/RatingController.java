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
import javax.servlet.http.HttpSession;

import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Ratings;
import com.stadiumbooking.model.StadiumDetalis;
import com.stadiumbooking.service.impl.RatingsServiceImpl;
import com.stadiumbooking.service.impl.StadiumServiceImpl;


@WebServlet("/ratings")
public class RatingController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static final StadiumServiceImpl stadiumService=new StadiumServiceImpl();
	static final RatingsServiceImpl ratingService=new RatingsServiceImpl();
	
	@Override
	public void service (HttpServletRequest req, HttpServletResponse res) {
		
		/*Getting Rating Details */
		
		HttpSession session3 = req.getSession();
		Double rating=Double.parseDouble(req.getParameter("ratingNumber"));
	
		int stadiumId=Integer.parseInt(req.getParameter("stadiumId"));

		String review=req.getParameter("review");
	
		int userId = (int) session3.getAttribute("id");
		Ratings ratings=new Ratings(userId,review,rating,stadiumId);
		try {
			ratingService.ratingStadium(ratings);
			List<StadiumDetalis> stadiumList=stadiumService.getAllStadiumList();
			req.setAttribute("stadiumList", stadiumList);
		
		      RequestDispatcher rd = req.getRequestDispatcher("ratingList.jsp");			
					rd.forward(req, res);
		} catch (SQLException | IOException e) {
		
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		} catch (ServletException e1) {
		
			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		}
	}
}
