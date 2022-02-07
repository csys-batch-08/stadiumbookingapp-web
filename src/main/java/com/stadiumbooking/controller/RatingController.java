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

import com.stadiumbooking.daoimpl.RatingsDaoImpl;
import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.model.Ratings;
import com.stadiumbooking.model.StadiumDetalis;


@WebServlet("/ratings")
public class RatingController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
	final RatingsDaoImpl ratingDao=new RatingsDaoImpl();
	
	@Override
	public void service (HttpServletRequest req, HttpServletResponse res) {
		
		/*Getting Rating Details */
		
		HttpSession session3 = req.getSession();
		Double rating=Double.parseDouble(req.getParameter("ratingNumber"));
	
		int stadiumId=Integer.parseInt(req.getParameter("stadiumId"));

		String review=req.getParameter("review");
	
		int userId = (int) session3.getAttribute("id");
		Ratings ratings=new Ratings(0,userId,review,rating,stadiumId);
		try {
			ratingDao.ratingStadium(ratings);
			List<StadiumDetalis> stadiumList=stadiumDao.getAllStadiumList();
			req.setAttribute("stadiumList", stadiumList);
		
		      RequestDispatcher rd = req.getRequestDispatcher("ratingList.jsp");			
					rd.forward(req, res);
		} catch (SQLException | IOException e) {
		
			e.getMessage();
		} catch (ServletException e1) {
		
			e1.getMessage();
		}
	}
}
