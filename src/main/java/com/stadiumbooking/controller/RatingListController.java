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
import com.stadiumbooking.model.StadiumDetalis;

@WebServlet("/ratingList")
public class RatingListController extends HttpServlet {
	
	final StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
	final RatingsDaoImpl ratingDao=new RatingsDaoImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		try {
			List<StadiumDetalis> stadiumList=stadiumDao.getAllStadiumList();
			req.setAttribute("stadiumList", stadiumList);
		
		      RequestDispatcher rd = req.getRequestDispatcher("ratingList.jsp");			
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
			
			e.getMessage();
		}
		
	
	}

}
