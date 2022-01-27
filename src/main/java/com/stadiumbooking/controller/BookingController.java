package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.daoimpl.SeatsDaoImpl;
import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.exception.HouseFull;
import com.stadiumbooking.exception.LowBalance;
import com.stadiumbooking.exception.LowSeatCount;
import com.stadiumbooking.model.Seats;
import com.stadiumbooking.model.User;

@WebServlet("/booking")
public class BookingController extends HttpServlet {

	final SeatsDaoImpl seatDao = new SeatsDaoImpl();
	final MatchDaoImpl matchDao = new MatchDaoImpl();
	final WalletDaoImpl walletDao = new WalletDaoImpl();
	final UserDaoImpl userDao = new UserDaoImpl();

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session2 = req.getSession();

		/* Getting Tickets Details */

		int seatCounts = Integer.parseInt(req.getParameter("seatCounts"));

		String seatclass = req.getParameter("category");

		int totalprice = Integer.parseInt(req.getParameter("totalprice"));

		int matchId = Integer.parseInt(req.getParameter("matchIds"));
		int userId = (int) session2.getAttribute("id");

		int totalAvalibleSeats = 0;
		int avalibleSeats = 0;

		try {
			totalAvalibleSeats = matchDao.checkAvilableSeats(matchId);
		} catch (ClassNotFoundException | SQLException e2) {

			e2.printStackTrace();
		}
		avalibleSeats = totalAvalibleSeats - seatCounts;

		if (totalAvalibleSeats != 0) {
			if (avalibleSeats >= 0) {

				try {
					Double userWallet = userDao.userWalletDetails(userId);

					if (userWallet >= totalprice) {
						String ticketNumber = req.getParameter("ticketNumber");

						Seats seats = new Seats(0, userId, ticketNumber, matchId, seatclass, totalprice, seatCounts,null);
						seatDao.bookingSeats(seats);

						userDao.bookingTicktes(userId, totalprice);
						matchDao.updateAvailableSeats(seatCounts, matchId);
						List<Seats> seatsList = seatDao.getSeatById(userId);
					

						HttpSession session = req.getSession();
						Double wallet = userDao.userWalletDetails(userId);

						session.setAttribute("wallet", wallet);
						req.setAttribute("seatListById", seatsList);
						

						RequestDispatcher rd = req.getRequestDispatcher("/mymatch.jsp");

						rd.forward(req, res);

					} else {
						throw new LowBalance();
					}
				} catch (ClassNotFoundException | SQLException | IOException e1) {
					e1.printStackTrace();
				} catch (LowBalance e) {
					try {
						HttpSession session = req.getSession();
						session.setAttribute("LowBalanceError", e.getMessage());
						res.sendRedirect("wallet.jsp");
					} catch (IOException e1) {

						e1.printStackTrace();
					}
				} catch (ServletException e) {

					e.printStackTrace();
				}
			}

			else {

				try {
					throw new LowSeatCount();
				} catch (LowSeatCount lc) {

					try {
						HttpSession session = req.getSession();
						session.setAttribute("LowCountSeats", lc.getMessage());
						res.sendRedirect("allMatchDetalis.jsp");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			}
		} else {
			try {
				throw new HouseFull();
			} catch (HouseFull hf) {

				try {
					HttpSession houseFullsession = req.getSession();
					houseFullsession.setAttribute("houseFull", hf.getMessage());
					res.sendRedirect("allMatchDetalis.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

}
