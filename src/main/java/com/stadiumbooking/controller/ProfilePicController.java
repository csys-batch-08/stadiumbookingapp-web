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

@WebServlet("/profilePic")
public class ProfilePicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static final UserServiceImpl userService=new UserServiceImpl();
	
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		String role=req.getParameter("role");
		

		String pic=req.getParameter("profilePic");
		
		int userId=(int) session.getAttribute("id");
		
		if(role.equals("Admin")) {
			try {
				userService.updateUserProfilePic(userId, pic);
			
				User userDetails=userService.getUserById(userId);
				req.setAttribute("user", userDetails);
				req.setAttribute("adminUpdate", "adminupdate");
				RequestDispatcher rd = req.getRequestDispatcher("/adminProfile.jsp");

				rd.forward(req, res);
			} catch (SQLException | IOException e) {
				
				Logger.printStackTrace(e);
				Logger.runTimeException(e.getMessage());
			} catch (ServletException e1) {
				
				Logger.printStackTrace(e1);
				Logger.runTimeException(e1.getMessage());
			}
		}
		else if(role.equals("User")) {
			try {
				userService.updateUserProfilePic(userId, pic);
				
				User userDetails=userService.getUserById(userId);
				req.setAttribute("user", userDetails);
				req.setAttribute("userUpdate", "userUpdate");
				  RequestDispatcher rd = req.getRequestDispatcher("usersprofile.jsp");			
					rd.forward(req, res);
			} catch (SQLException | IOException e) {
				
				Logger.printStackTrace(e);
				Logger.runTimeException(e.getMessage());
			} catch (ServletException e1) {
				
				Logger.printStackTrace(e1);
				Logger.runTimeException(e1.getMessage());
			}
		
		}
	}
	

}
