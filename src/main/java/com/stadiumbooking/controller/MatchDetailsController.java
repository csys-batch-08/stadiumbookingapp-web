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

import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Sports;
import com.stadiumbooking.model.StadiumDetalis;
import com.stadiumbooking.service.impl.SportsServiceImpl;
import com.stadiumbooking.service.impl.StadiumServiceImpl;

@WebServlet("/matchDetails")
public class MatchDetailsController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static final SportsServiceImpl sportService=new SportsServiceImpl();
	static final StadiumServiceImpl stadiumService=new StadiumServiceImpl();
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res)  {
		
	
		try {
			   List<Sports> sportsList=sportService.getAllSports();
			   List<StadiumDetalis> stadiumList=stadiumService.getAllStadiumList();
				req.setAttribute("stadiumList", stadiumList);
			    req.setAttribute("sportsList", sportsList);
			
			 RequestDispatcher rd = req.getRequestDispatcher("matchDetails.jsp");
				rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
	
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
	
		
	}

}
