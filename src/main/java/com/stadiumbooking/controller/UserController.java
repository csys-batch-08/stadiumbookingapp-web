package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.exception.RegisterSuccessful;
import com.stadiumbooking.exception.SomthingWentWrong;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.User;
import com.stadiumbooking.service.impl.UserServiceImpl;

@WebServlet("/regSevr")
public class UserController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static final UserServiceImpl userService=new UserServiceImpl();

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {

		/* Getting User Details */

		HttpSession session = req.getSession();
		String name = req.getParameter("name").trim();
		String uname = req.getParameter("uname").trim();
		String pass = req.getParameter("pass").trim();
		String mail = req.getParameter("mail").trim();
		Long phone = Long.parseLong(req.getParameter("phone"));
	
		User user = new User();
		user.setName(name);
		user.setUsername(uname);
		user.setPassword(pass);
		user.setEmail(mail);
		user.setPhoneNumber(phone);
		try {

			boolean flag=userService.checkUser(uname, mail, phone);
			if (flag) {
				
				userService.insertUser(user);
				throw new RegisterSuccessful();
			
			} else {
				throw new SomthingWentWrong();
			}
		} catch (SQLException e1) {
			
			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		} catch (RegisterSuccessful e) {

			try {
			
				session.setAttribute("error",null);
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful", e.getMessage());
				res.sendRedirect("index.jsp");
			} catch (IOException e1) {
				
				Logger.printStackTrace(e1);
				Logger.runTimeException(e1.getMessage());
			}
		} catch (SomthingWentWrong e) {
			try {
				

				session.setAttribute("error",null);
				session.setAttribute("SomthingWentWrong", e.getMessage());
				res.sendRedirect("index.jsp");
			} catch (IOException e2) {
				
				Logger.printStackTrace(e2);
				Logger.runTimeException(e2.getMessage());
			}
		} catch (ClassNotFoundException e) {
		
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}

	}

}
