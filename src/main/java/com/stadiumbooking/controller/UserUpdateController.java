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



@WebServlet("/update")
public class UserUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final UserServiceImpl userService=new UserServiceImpl();

	
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

		User user=new User();
		user.setUserid(userId);
		user.setName(name);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhoneNumber(phoneNumber);
		try {
			
			if(role.equals("Admin")) 
			{
				
				userService.updateUser(user);
				int userID=(int) session1.getAttribute("id");
				User userDetails=userService.getUserById(userID);
				req.setAttribute("user", userDetails);
	         	req.setAttribute("adminUpdate", "adminupdate");
	         	 RequestDispatcher rd = req.getRequestDispatcher("adminProfile.jsp");			
					rd.forward(req, res);
	}
	else if(role.equals("User")) {
		
		userService.updateUser(user);
		int userID=(int) session1.getAttribute("id");
		User userDetails=userService.getUserById(userID);
		req.setAttribute("user", userDetails);
		req.setAttribute("userUpdate", "userUpdate");
		 RequestDispatcher rd = req.getRequestDispatcher("usersprofile.jsp");			
			rd.forward(req, res);
	}
		
		} catch (SQLException e) {
	
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		} catch (IOException e1) {
			
			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		} catch (ServletException e2) {
			
			Logger.printStackTrace(e2);
			Logger.runTimeException(e2.getMessage());
		}
	}
	

}
