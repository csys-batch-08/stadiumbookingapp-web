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

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.model.User;


@WebServlet("/deleteUser")
public class DeleteUserController extends HttpServlet {
	
	static final UserDaoImpl userDao=new UserDaoImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

	
		try {
			int userId=Integer.parseInt(req.getParameter("userId"));
			      userDao.deleteUser(userId);
			  List<User> userLists= userDao.getAllUser();
			 req.setAttribute("UserLists", userLists);
		
		      RequestDispatcher rd = req.getRequestDispatcher("getallusers.jsp");			
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException |NumberFormatException e  ) {
			
			  req.getRequestDispatcher("index.jsp");
		}
		
	
	}

}
