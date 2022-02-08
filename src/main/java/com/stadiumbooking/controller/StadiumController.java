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

import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.StadiumDetalis;
import com.stadiumbooking.service.impl.StadiumServiceImpl;



@WebServlet("/stadium")
public class StadiumController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final StadiumServiceImpl stadiumService=new StadiumServiceImpl();
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {
		
		/*Getting StadiumDetails */
		
		String stadiumName=req.getParameter("stadiumName");
		String stadiumImage=req.getParameter("stadiumImge");
		
		StadiumDetalis stadium=new StadiumDetalis(0,stadiumName,stadiumImage);
	
		
		try {
			stadiumService.insertStadium(stadium);
			List<StadiumDetalis> stadiumList=stadiumService.getAllStadiumList();
			req.setAttribute("stadiumList", stadiumList);
		
		      RequestDispatcher rd = req.getRequestDispatcher("stadiumList.jsp");			
					rd.forward(req, res);
		} catch (IOException e) {
		
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		} catch (SQLException e2) {

			Logger.printStackTrace(e2);
			Logger.runTimeException(e2.getMessage());
		} catch (ServletException e3) {
			
			Logger.printStackTrace(e3);
			Logger.runTimeException(e3.getMessage());
		}
	}
}

