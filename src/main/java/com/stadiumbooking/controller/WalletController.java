package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.model.Wallet_details;



@WebServlet("/wallets")
public class WalletController extends HttpServlet {
	WalletDaoImpl walletDao=new WalletDaoImpl();
	public void service(HttpServletRequest req,HttpServletResponse res) {
		
		/* Getting User Wallet Details */
		HttpSession LowBalanceSession=req.getSession();
		int userId=Integer.parseInt(req.getParameter("userID"));
		Long amount=Long.parseLong(req.getParameter("amount"));
		
		LowBalanceSession.setAttribute("LowBalanceError", null);
		
		Wallet_details wallet=new Wallet_details(userId,amount);
		try {
			walletDao.insertAmount(wallet);
			res.sendRedirect("wallet.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
