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
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.model.User;

@WebServlet("/profilePic")
public class ProfilePicController extends HttpServlet {
	final UserDaoImpl userDao=new UserDaoImpl();
	
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		String role=req.getParameter("role");
		

		String pic=req.getParameter("profilePic");
		
		int userId=(int) session.getAttribute("id");
		
		if(role.equals("Admin")) {
			try {
				userDao.updateUserProfilePic(userId, pic);
			
				List<User> userDetails=userDao.getUserById(userId);
				req.setAttribute("userDateils", userDetails);
				
				RequestDispatcher rd = req.getRequestDispatcher("/adminProfile.jsp");

				rd.forward(req, res);
			} catch (SQLException | IOException e) {
				
				e.printStackTrace();
			} catch (ServletException e1) {
				
				e1.printStackTrace();
			}
		}
		else if(role.equals("User")) {
			try {
				userDao.updateUserProfilePic(userId, pic);
				
				List<User> userDetails=userDao.getUserById(userId);
				req.setAttribute("userDateils", userDetails);
			
				  RequestDispatcher rd = req.getRequestDispatcher("usersprofile.jsp");			
					rd.forward(req, res);
			} catch (SQLException | IOException e) {
				
				e.printStackTrace();
			} catch (ServletException e1) {
				
				e1.printStackTrace();
			}
		
		}
	}
	

}
