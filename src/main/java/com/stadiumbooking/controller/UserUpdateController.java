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



@WebServlet("/update")
public class UserUpdateController extends HttpServlet {
	
	final UserDaoImpl userDao=new UserDaoImpl();

	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {
		
		/* Getting User Updated Details  */
		
		HttpSession session1 = req.getSession();
		String name=req.getParameter("updateName").trim();
		String username=req.getParameter("updateUsername").trim();
		String role=req.getParameter("role").trim();
		String password=req.getParameter("updatePassword").trim();
		String email=req.getParameter("updateEmail").trim();
		Long phoneNumber=Long.parseLong(req.getParameter("updateNumber"));
		int userId = (int) session1.getAttribute("id");

		
		try {
			
			if(role.equals("Admin")) 
			{
				User user=new User(userId, name, username,null, password, email, phoneNumber,0.0,null);
				userDao.updateUser(user);
				int userID=(int) session1.getAttribute("id");
				List<User> userDetails=userDao.getUserById(userID);
				req.setAttribute("userDateils", userDetails);
	         	
	         	 RequestDispatcher rd = req.getRequestDispatcher("adminProfile.jsp");			
					rd.forward(req, res);
	}
	else if(role.equals("User")) {
		User user=new User(userId, name, username,null, password, email, phoneNumber,0.0,null);
		userDao.updateUser(user);
		int userID=(int) session1.getAttribute("id");
		List<User> userDetails=userDao.getUserById(userID);
		req.setAttribute("userDateils", userDetails);
		
		 RequestDispatcher rd = req.getRequestDispatcher("usersprofile.jsp");			
			rd.forward(req, res);
	}
		
		} catch (SQLException e) {
	
			e.getMessage();
		} catch (IOException e1) {
			
			e1.getMessage();
		} catch (ServletException e2) {
			
			e2.getMessage();
		}
	}
	

}
