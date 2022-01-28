package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
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
import com.stadiumbooking.daoimpl.RatingsDaoImpl;
import com.stadiumbooking.daoimpl.SeatsDaoImpl;
import com.stadiumbooking.daoimpl.SportsDaoImpl;
import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.exception.NotFound;
import com.stadiumbooking.model.Match;
import com.stadiumbooking.model.Seats;
import com.stadiumbooking.model.Sports;
import com.stadiumbooking.model.StadiumDetalis;
import com.stadiumbooking.model.User;
import com.stadiumbooking.model.WalletDetails;

@WebServlet("/loginServe")
public class UserLoginController extends HttpServlet {

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

					res.sendRedirect("adminHome.html");

				} else if (role.equals("User")) {

					res.sendRedirect("userHome.html");
				}

			} else {
				throw new NotFound();
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (NotFound e) {

			try {
				HttpSession session = req.getSession();
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful", null);
				session.setAttribute("error", e.getMessage());
				res.sendRedirect("index.jsp");

			} catch (IOException e1) {

				e1.printStackTrace();
			}
		} catch (IOException e2) {

			e2.printStackTrace();
		}

	}

}
