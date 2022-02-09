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
import com.stadiumbooking.model.StadiumDetalis;
import com.stadiumbooking.service.impl.StadiumServiceImpl;

@WebServlet("/stadiumList")
public class StadiumListController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	final StadiumServiceImpl stadiumService=new StadiumServiceImpl();
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		try {
			List<StadiumDetalis> stadiumList=stadiumService.getAllStadiumList();
			req.setAttribute("stadiumList", stadiumList);
		
		      RequestDispatcher rd = req.getRequestDispatcher("stadiumList.jsp");			
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
		
	
	}

}
