package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.User;
import com.stadiumbooking.service.impl.UserServiceImpl;

@WebServlet("/checkUserEmail")
public class CheckEmailController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	static final UserServiceImpl userService=new UserServiceImpl();
	
	 @Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)  {
		 String email =req.getParameter("email"); 
		
	
		 try {
			User user=userService.checkUserEmail(email);
			if(user==null) {
				res.getWriter().print("");
			}
			else
			{res.getWriter().print("Already Registered Email");
			}
			
			 
		} catch (SQLException | IOException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
	}

}
