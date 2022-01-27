package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.model.WalletDetails;



@WebServlet("/wallets")
public class WalletController extends HttpServlet {
	final WalletDaoImpl walletDao=new WalletDaoImpl();
	final UserDaoImpl userDao=new UserDaoImpl();
	@Override
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		
		/* Getting User Wallet Details */
		HttpSession session=req.getSession();
		int userId=Integer.parseInt(req.getParameter("userID"));
		Long amount=Long.parseLong(req.getParameter("amount"));
		
		session.setAttribute("LowBalanceError", null);
		
		WalletDetails wallet=new WalletDetails(0,userId,amount,null);
		try {
			walletDao.insertAmount(wallet);
			Double userWallet=userDao.userWalletDetails(userId);
			
			session.setAttribute("wallet", userWallet);
			res.sendRedirect("wallet.jsp");
		} catch (ClassNotFoundException | SQLException e) {
						e.printStackTrace();
		} catch (IOException e1) {

			e1.printStackTrace();
		}
	}
	

}
