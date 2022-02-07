package com.stadiumbooking.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.exception.NotFound;
import com.stadiumbooking.model.User;


@WebServlet("/loginServe")
public class UserLoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final UserDaoImpl userDao = new UserDaoImpl();

	final MatchDaoImpl matchDao = new MatchDaoImpl();

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {

		/* User Login Details */

		String userName = req.getParameter("username").trim();
		String passWord = req.getParameter("password").trim();


		try {
			boolean flag;

			flag = userDao.checkUser(userName, passWord);
			if (flag) {

				List<User> userList = userDao.validateUser(userName, passWord);
				String role = userList.get(0).getRole();
				int userID = userList.get(0).getUserid();
				HttpSession session = req.getSession();
				session.setAttribute("error", null);
				session.setAttribute("id", userID);
				session.setAttribute("role", role);
				LocalDate today = matchDao.getDate();
				session.setAttribute("today", today);
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful", null);
				if (role.equals("Admin")) {

					req.setAttribute("admin", "admin");
					RequestDispatcher rd = req.getRequestDispatcher("adminHome.jsp");
					rd.forward(req, res);

				} else if (role.equals("User")) {

					req.setAttribute("user", "user");
					RequestDispatcher rd = req.getRequestDispatcher("userHome.jsp");
					rd.forward(req, res);
				}

			} else {
				throw new NotFound();
			}
		} catch (SQLException e) {

			e.getMessage();
		} catch (NotFound e) {

			try {
				HttpSession session = req.getSession();
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful", null);
				session.setAttribute("error", e.getMessage());
				res.sendRedirect("index.jsp");

			} catch (IOException e1) {

				e1.getMessage();
			}
		} catch (IOException e2) {

			e2.getMessage();
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}

}
