package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

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
	
	UserDaoImpl userDao=new UserDaoImpl();
	WalletDaoImpl walletDao=new WalletDaoImpl();
	SportsDaoImpl sportDao=new SportsDaoImpl();
	StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
	SeatsDaoImpl seatsDao=new SeatsDaoImpl();
	RatingsDaoImpl ratingDao=new RatingsDaoImpl();
	public void service(HttpServletRequest req, HttpServletResponse res)  {
		
		/* User Login Details */
		User user=new User();
		
		String userName=req.getParameter("username").trim();
		String passWord=req.getParameter("password").trim();
		//System.out.println(userName);
		int id=0;
		try {
			boolean flag;
			
			flag=userDao.checkUser(userName, passWord);
			if(flag) {
			
			List<User> userList= userDao.validateUser(userName, passWord);
			
			String role=userList.get(0).getRole();
			//System.out.println(role);
		
			
			int userID = userList.get(0).getUserid();
			//System.out.println(userID);
			List<User> userDetails=userDao.getUserById(userID);
			HttpSession session = req.getSession();
			session.setAttribute("error",null );
			session.setAttribute("id", userID);
			session.setAttribute("userDateils", userDetails);
			 //System.out.println(userID);
			MatchDaoImpl matchDao=new MatchDaoImpl();
			List<Match> matchDetails=matchDao.getAllMatchDetalis();
			session.setAttribute("MatchDetails", matchDetails);
			LocalDate today=matchDao.getDate();
			List<StadiumDetalis> stadiumList=stadiumDao.getAllStadiumList();
			session.setAttribute("stadiumList", stadiumList);
			session.setAttribute("today", today);
			if(role.equals("Admin")) 
					{
				   
				    List<User> userLists= userDao.getAllUser();
				    List<WalletDetails> walletList=walletDao.allUserWalletList();
				    List<Sports> sportsList=sportDao.getAllSports();
				    List<Seats> seatList=seatsDao.getSeatsDetalis();
				  // System.out.println(walletList.get(0));
				    session.setAttribute("walletList", walletList);
				    session.setAttribute("UserLists", userLists);
				    session.setAttribute("sportsList", sportsList);
				    session.setAttribute("seatList", seatList);
				   session.setAttribute("SomthingWentWrong", null);
				    session.setAttribute("RegisterSuccessful", null);
				      res.sendRedirect("adminHome.html");
				//res.sendRedirect("adminHome.html?userid=+rs.getInt(1));

			}
			else if(role.equals("User")) {
				Double wallet=userDao.userWalletDetails(userID);
				//System.out.println(wallet);
				List<Seats> seatListById=seatsDao.getSeatById(userID);
				session.setAttribute("seatListById", seatListById);
				session.setAttribute("wallet", wallet);
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful", null);
				res.sendRedirect("userHome.html");
			}
			
			}
			else {
				throw new NotFound();
//				HttpSession session = req.getSession();
//			 throw new NotFound();
//				session.setAttribute("error",error );
//				res.sendRedirect("index.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(IOException e) {
			System.out.println(e);
		} catch (NotFound e) {
			// TODO Auto-generated catch block
			try {
				HttpSession session = req.getSession();
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful",null);
					session.setAttribute("error",e.getMessage() );
				res.sendRedirect("index.jsp");
				
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				
				e1.printStackTrace();
			}
		}
	
	
		

		
		
		
	}
	
	
	
	            
	
}
