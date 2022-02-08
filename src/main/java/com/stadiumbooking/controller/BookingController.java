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

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.daoimpl.SeatsDaoImpl;
import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.exception.HouseFull;
import com.stadiumbooking.exception.LowBalance;
import com.stadiumbooking.exception.LowSeatCount;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Match;
import com.stadiumbooking.model.Seats;
import com.stadiumbooking.model.User;


@WebServlet("/booking")
public class BookingController extends HttpServlet {

	private static final long serialVersionUID = 1L;
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
		String ticketNumber = req.getParameter("ticketNumber");

		int totalAvalibleSeats = 0;
		int avalibleSeats = 0;

		try {
			totalAvalibleSeats = matchDao.checkAvilableSeats(matchId);
		} catch (SQLException e2) {

			Logger.printStackTrace(e2);
			Logger.runTimeException(e2.getMessage());
		}
		avalibleSeats = totalAvalibleSeats - seatCounts;
//If Seats Are Avalible (>0)
		
		if (totalAvalibleSeats != 0) {
			if (avalibleSeats >= 0) {

				try {
					Double walletBlance = userDao.userWalletDetails(userId);

					if (walletBlance >= totalprice) {
						

						User user=new User();
						user.setUserid(userId);
						Match match=new Match();
						match.setMatchId(matchId);
						Seats seats = new Seats();
						seats.setUserid(user);
						seats.setTicketNumbers(ticketNumber);
						seats.setMatchId(match);
						seats.setSeatclass(seatclass);
						seats.setPrice(totalprice);
						seats.setSeatcount(seatCounts);
						seatDao.bookingSeats(seats);

						userDao.bookingTicktes(userId, totalprice);
						matchDao.updateAvailableSeats(seatCounts, matchId);
						List<Seats> seatsList = seatDao.getSeatById(userId);
					

						HttpSession session = req.getSession();
						Double wallet = userDao.userWalletDetails(userId);

						session.setAttribute("wallet", wallet);
						req.setAttribute("seatListById", seatsList);
						req.setAttribute("cancel",null);

						RequestDispatcher rd = req.getRequestDispatcher("/mymatch.jsp");

						rd.forward(req, res);

					} else {
						throw new LowBalance();
					}
				} catch (SQLException | IOException e1) {
					req.getRequestDispatcher("index.jsp");
				} catch (LowBalance e) {
					try {
						HttpSession session = req.getSession();
						session.setAttribute("LowBalanceError", e.getMessage());

						int userID=(int) session.getAttribute("id");
						Double wallet=userDao.userWalletDetails(userID);
						
						session.setAttribute("wallet", wallet);
					      RequestDispatcher rd = req.getRequestDispatcher("wallet.jsp");			
								rd.forward(req, res);
					} catch (IOException |SQLException|ServletException e1) {

						Logger.printStackTrace(e1);
						Logger.runTimeException(e1.getMessage());
					} 
			} catch (ServletException e) {
		
				Logger.printStackTrace(e);
				Logger.runTimeException(e.getMessage());
				}}

			else {

				try {
					throw new LowSeatCount();
				} catch (LowSeatCount lc) {

					try {
						HttpSession session = req.getSession();
						session.setAttribute("LowCountSeats", lc.getMessage());
						List<Match> matchDetails = matchDao.getAllMatchDetalis();
						req.setAttribute("MatchDetails", matchDetails);
						
					
						 RequestDispatcher rd = req.getRequestDispatcher("allMatchDetalis.jsp");
							rd.forward(req, res);
					} catch (IOException | SQLException | ServletException e) {
						Logger.printStackTrace(e);
						Logger.runTimeException(e.getMessage());
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
					List<Match> matchDetails = matchDao.getAllMatchDetalis();
					req.setAttribute("MatchDetails", matchDetails);
					 RequestDispatcher rd = req.getRequestDispatcher("allMatchDetalis.jsp");
						rd.forward(req, res);
				} catch (IOException | SQLException e) {
					Logger.printStackTrace(e);
					Logger.runTimeException(e.getMessage());
				} catch (ServletException e1) {
					
					Logger.printStackTrace(e1);
					Logger.runTimeException(e1.getMessage());
				}
			}
		}

	}

}
