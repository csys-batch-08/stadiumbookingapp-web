package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Match;


@WebServlet("/updateMatchCall")
public class UpdateMacthCallController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final MatchDaoImpl matchDao=new MatchDaoImpl();
	
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
	
	
		
		int matchId=Integer.parseInt(req.getParameter("matchId"));
		try {
			
			Match match = matchDao.getMatchByMatchId(matchId);
			req.setAttribute("match", match);
			
		      RequestDispatcher rd = req.getRequestDispatcher("updateMatch.jsp");			
					rd.forward(req, res);
		} catch (SQLException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		} catch (IOException e2) {
		
			Logger.printStackTrace(e2);
			Logger.runTimeException(e2.getMessage());
		} catch (ServletException e1) {
			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		}
	}
}
