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



@WebServlet("/update")
public class UserUpdateController extends HttpServlet {
	
	UserDaoImpl userDao=new UserDaoImpl();

	
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
		//System.out.println(name+"\n"+username+"\n"+userId+password+email+phoneNumber+"\n"+role);
		
		try {
			
			if(role.equals("Admin")) 
			{
				User user=new User(userId, name, username, password, email, phoneNumber);
				userDao.updateUser(user);
				int userID=(int) session1.getAttribute("id");
				List<User> userDetails=userDao.getUserById(userID);
				session1.setAttribute("userDateils", userDetails);
	         	res.sendRedirect("adminProfile.jsp");
	}
	else if(role.equals("User")) {
		User user=new User(userId, name, username, password, email, phoneNumber);
		userDao.updateUser(user);
		int userID=(int) session1.getAttribute("id");
		List<User> userDetails=userDao.getUserById(userID);
		session1.setAttribute("userDateils", userDetails);
		res.sendRedirect("usersprofile.jsp");
	}
			
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
