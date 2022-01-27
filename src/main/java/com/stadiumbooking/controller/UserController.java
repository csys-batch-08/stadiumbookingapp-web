package com.stadiumbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.exception.RegisterSuccessful;
import com.stadiumbooking.exception.SomthingWentWrong;
import com.stadiumbooking.model.User;

@WebServlet("/regSevr")
public class UserController extends HttpServlet {

	final UserDaoImpl userDao = new UserDaoImpl();

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {

		/* Getting User Details */

		String name = req.getParameter("name").trim();
		String uname = req.getParameter("uname").trim();
		String pass = req.getParameter("pass").trim();
		String mail = req.getParameter("mail").trim();
		Long phone = Long.parseLong(req.getParameter("phone"));
	
		User user = new User(name, uname, pass, mail, phone);
		try {

			boolean flag=userDao.checkUser(uname, mail, phone);
			if (flag) {
				
				userDao.insertUser(user);
				throw new RegisterSuccessful();
			
			} else {
				throw new SomthingWentWrong();
			}
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();

		} catch (SQLException e1) {
			
			e1.printStackTrace();
		} catch (RegisterSuccessful e) {

			try {
				HttpSession session = req.getSession();
				session.setAttribute("error",null);
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful", e.getMessage());
				res.sendRedirect("index.jsp");
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
		} catch (SomthingWentWrong e) {
			try {
				HttpSession session = req.getSession();

				session.setAttribute("error",null);
				session.setAttribute("SomthingWentWrong", e.getMessage());
				res.sendRedirect("index.jsp");
			} catch (IOException e2) {
				
				e2.printStackTrace();
			}
		}

	}

}
