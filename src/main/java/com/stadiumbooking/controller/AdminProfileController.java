package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.User;
import com.stadiumbooking.service.impl.UserServiceImpl;

@WebServlet("/adminProfile")
public class AdminProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static final UserServiceImpl userService=new UserServiceImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)  {
	
		HttpSession session = req.getSession();
		
		int userID=(int) session.getAttribute("id");
		session.setAttribute("error",null );
		
		try {
			User userDetails = userService.getUserById(userID);
			req.setAttribute("user", userDetails);  
			
		      RequestDispatcher rd = req.getRequestDispatcher("adminProfile.jsp");
			
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
		
	
	}

}
