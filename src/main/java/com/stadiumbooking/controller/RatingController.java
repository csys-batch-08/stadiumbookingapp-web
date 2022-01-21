package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.RatingsDaoImpl;
import com.stadiumbooking.model.Ratings;


@WebServlet("/ratings")
public class RatingController extends HttpServlet {

	RatingsDaoImpl ratingDao=new RatingsDaoImpl();
	
	public void service (HttpServletRequest req, HttpServletResponse res) {
		
		/*Getting Rating Details */
		
		HttpSession session3 = req.getSession();
		Double rating=Double.parseDouble(req.getParameter("ratingNumber"));
		//System.out.println(rating);
		int stadiumId=Integer.parseInt(req.getParameter("stadiumId"));
		//System.out.println(stadiumId);
		String review=req.getParameter("review");
		//System.out.println(review);
		int userId = (int) session3.getAttribute("id");
		Ratings ratings=new Ratings(userId,review,rating,stadiumId);
		try {
			ratingDao.ratingStadium(ratings);
			res.sendRedirect("ratingList.jsp");
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
