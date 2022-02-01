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

import com.stadiumbooking.daoimpl.SeatsDaoImpl;
import com.stadiumbooking.model.Seats;

@WebServlet("/mymatch")
public class MymatchController extends HttpServlet {

	final SeatsDaoImpl seatsDao = new SeatsDaoImpl();

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		try {
			HttpSession session = req.getSession();

			int userID = (int) session.getAttribute("id");

			List<Seats> seatListById = seatsDao.getSeatById(userID);
			req.setAttribute("seatListById", seatListById);

			RequestDispatcher rd = req.getRequestDispatcher("mymatch.jsp");
			rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {

			e.getMessage();
		}

	}

}
