package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

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


@WebServlet("/booking")
public class BookingController extends HttpServlet {
	
	SeatsDaoImpl seatDao=new SeatsDaoImpl();
	MatchDaoImpl matchDao=new MatchDaoImpl();
	WalletDaoImpl walletDao=new WalletDaoImpl();
	UserDaoImpl userDao=new UserDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session2 = req.getSession();
	
		/*  Getting Tickets Details */
		
		int seatCounts=Integer.parseInt(req.getParameter("seatCounts"));
		//System.out.println(seatCounts);
		String seatclass=req.getParameter("category");
		//System.out.println(seatclass);
		int totalprice=Integer.parseInt(req.getParameter("totalprice"));
		//System.out.println(totalprice);
		int matchId=Integer.parseInt(req.getParameter("matchIds"));
		//System.out.println(matchId);
		int userId =  (int) session2.getAttribute("id");
		//System.out.println(userId);
	
		UserDaoImpl userDao=new UserDaoImpl();
		int totalAvalibleSeats=0;
		int avalibleSeats=0;
		try {
			totalAvalibleSeats = matchDao.checkAvilableSeats(matchId);
			avalibleSeats=totalAvalibleSeats-seatCounts;
			
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		if(totalAvalibleSeats!=0) {
              if(avalibleSeats>=0) {
				
			
		try {
			Double userWallet=userDao.userWalletDetails(userId);
			//System.out.println(userWallet);

			
			
			
			if(userWallet>=totalprice) {
	         String ticketNumber=req.getParameter("ticketNumber");
			
			//System.out.println(seatclass+seatCounts+totalprice+matchId+userId);
			Seats seats=new Seats(userId,ticketNumber,matchId,seatclass,totalprice,seatCounts);
			seatDao.bookingSeats(seats);
		
			userDao.bookingTicktes(userId, totalprice);
			matchDao.updateAvailableSeats(seatCounts, matchId);
			
			res.sendRedirect("mymatch.jsp?ticketId=0");
			}
			else {
			throw new LowBalance();
			}
		} catch (ClassNotFoundException | SQLException | IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (LowBalance e) {
		try {
			HttpSession LowBalanceSession=req.getSession();
			LowBalanceSession.setAttribute("LowBalanceError", e.getMessage());
				res.sendRedirect("wallet.jsp");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		}
              
              else {
            	 
            	  try {
      				throw new LowSeatCount();
      			}
      			catch(LowSeatCount Lc){
      				
      				try {
      					HttpSession LowCountSeatsSesssion=req.getSession();
      					LowCountSeatsSesssion.setAttribute("LowCountSeats", Lc.getMessage());
      					res.sendRedirect("allMatchDetalis.jsp");
      				} catch (IOException e) {
      					// TODO Auto-generated catch block
      					e.printStackTrace();
      				}
      			}
            	  
              }
		}
		else {
			try {
				throw new HouseFull();
			}
			catch(HouseFull hf){
				
				try {
					HttpSession HouseFullsession=req.getSession();
					HouseFullsession.setAttribute("houseFull", hf.getMessage());
					res.sendRedirect("allMatchDetalis.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}
		
	}
	
	

