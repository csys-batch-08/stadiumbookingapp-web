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

@WebServlet("/checkPhonenumber")
public class CheckPhoneNumberController  extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static final UserServiceImpl userService=new UserServiceImpl();
	
	 @Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)  {
		
		 try {
			 Long phoneNumber=Long.parseLong(req.getParameter("phone"));	
			User user=userService.checkPhoneNumber(phoneNumber);
			if(user==null) {
				res.getWriter().print("");
			}
			else
			{res.getWriter().print("Already Registered Mobile No");
			}
			
			 
		} catch (SQLException | IOException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}catch(NumberFormatException  e2) {
			Logger.printStackTrace(e2);
			Logger.runTimeException(e2.getMessage());
		}
	}

}
