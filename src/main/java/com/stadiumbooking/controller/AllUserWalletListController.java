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

import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.WalletDetails;
import com.stadiumbooking.service.impl.WalletServiceImpl;

@WebServlet("/allUserWalletList")
public class AllUserWalletListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final WalletServiceImpl walletService=new WalletServiceImpl();
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		try {
		    List<WalletDetails> walletList=walletService.allUserWalletList();
			 
		    req.setAttribute("walletList", walletList);
			   
		
		      RequestDispatcher rd = req.getRequestDispatcher("allUserWalletList.jsp");			
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
		
	
	}

}
