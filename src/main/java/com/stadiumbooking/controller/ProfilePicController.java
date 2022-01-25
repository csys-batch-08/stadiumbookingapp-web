package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.model.User;

@WebServlet("/profilePic")
public class ProfilePicController extends HttpServlet {
	UserDaoImpl userDao=new UserDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		String role=req.getParameter("role");
		//System.out.println(role);

		String pic=req.getParameter("profilePic");
		//System.out.println(pic);
		int userId=(int) session.getAttribute("id");
		//System.out.println(userId);
		if(role.equals("Admin")) {
			try {
				userDao.updateUserProfilePic(userId, pic);
			
				List<User> userDetails=userDao.getUserById(userId);
				session.setAttribute("userDateils", userDetails);
				res.sendRedirect("adminProfile.jsp");
			} catch (ClassNotFoundException | SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(role.equals("User")) {
			try {
				userDao.updateUserProfilePic(userId, pic);
				
				List<User> userDetails=userDao.getUserById(userId);
				session.setAttribute("userDateils", userDetails);
				res.sendRedirect("usersprofile.jsp");
			} catch (ClassNotFoundException | SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
	}
	

}
