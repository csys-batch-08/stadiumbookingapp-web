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


import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.WalletDetails;


@WebServlet("/wallet")
public class UserWalletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final UserDaoImpl userDao=new UserDaoImpl();
	final WalletDaoImpl walletDao=new WalletDaoImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		try {
			HttpSession session = req.getSession();
			
			int userID=(int) session.getAttribute("id");
			Double wallet=userDao.userWalletDetails(userID);
			List<WalletDetails> userWalletList=walletDao.getUserWalletListById(userID);
			req.setAttribute("userWalletList", userWalletList);
			session.setAttribute("wallet", wallet);
		      RequestDispatcher rd = req.getRequestDispatcher("wallet.jsp");			
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
		
	
	}

}
