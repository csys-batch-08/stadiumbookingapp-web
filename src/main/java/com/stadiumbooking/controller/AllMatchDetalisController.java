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

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Match;
import com.stadiumbooking.service.impl.MatchServiceImpl;
@WebServlet("/allMatchDetalis")
public class AllMatchDetalisController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final MatchServiceImpl matchService=new MatchServiceImpl();
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res)  {
		
		
		try {
			List<Match> matchDetails = matchService.getAllMatchDetalis();
			req.setAttribute("MatchDetails", matchDetails);
			
		
			 RequestDispatcher rd = req.getRequestDispatcher("allMatchDetalis.jsp");
				rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
	
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
	
		
	}

}
