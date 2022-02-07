package com.stadiumbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.model.User;


@WebServlet("/checkUserName")
public class CheckUsernameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 final UserDaoImpl userDao=new UserDaoImpl();
	
	 @Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)  {
		 String userName =req.getParameter("userName"); 
		 try {
			User user=userDao.checkUser(userName);
			if(user==null) {
				res.getWriter().print("");
			}
			else
			{res.getWriter().print("Already Registered Username");
			}
			
			 
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}

}
