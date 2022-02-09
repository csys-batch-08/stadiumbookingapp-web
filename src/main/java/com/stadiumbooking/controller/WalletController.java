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

import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.User;
import com.stadiumbooking.model.WalletDetails;
import com.stadiumbooking.service.impl.UserServiceImpl;
import com.stadiumbooking.service.impl.WalletServiceImpl;



@WebServlet("/wallets")
public class WalletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final WalletServiceImpl walletService=new WalletServiceImpl();
	static final UserServiceImpl userService=new UserServiceImpl();
	@Override
	public void doGet(HttpServletRequest req,HttpServletResponse res) {
		
		/* Getting User Wallet Details */
	
		try {
			int userId=Integer.parseInt(req.getParameter("userID"));
			Long amount=Long.parseLong(req.getParameter("amount"));
			HttpSession session=req.getSession();
			session.setAttribute("LowBalanceError", null);
			User user=new User();
			user.setUserid(userId);
			WalletDetails wallet=new WalletDetails();
			wallet.setUser(user);
			wallet.setAmount(amount);
			walletService.insertAmount(wallet);
			Double userWallet=userService.userWalletDetails(userId);
			
			session.setAttribute("wallet", userWallet);
			req.setAttribute("walletAdd", "walletAdd");
			List<WalletDetails> userWalletList=walletService.getUserWalletListById(userId);
			req.setAttribute("userWalletList", userWalletList);
			  RequestDispatcher rd = req.getRequestDispatcher("wallet.jsp");
				
				rd.forward(req, res);
		} catch (SQLException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		} catch (IOException e1) {

			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		}catch(NumberFormatException  e2) {
			Logger.printStackTrace(e2);
			Logger.runTimeException(e2.getMessage());
		} catch (ServletException e3) {

			Logger.printStackTrace(e3);
			Logger.runTimeException(e3.getMessage());
		}
		
	}
	

}
