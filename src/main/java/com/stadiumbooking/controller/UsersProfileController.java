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

@WebServlet("/usersprofile")
public class UsersProfileController  extends HttpServlet {
	
	final UserDaoImpl userDao=new UserDaoImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {
	
		HttpSession session = req.getSession();
		
		int userID=(int) session.getAttribute("id");
		session.setAttribute("error",null );
		
		try {
			List<User> userDetails = userDao.getUserById(userID);
			req.setAttribute("userDateils", userDetails);  
		      RequestDispatcher rd = req.getRequestDispatcher("usersprofile.jsp");
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
			
			e.getMessage();
		}
		
	
	}

}
