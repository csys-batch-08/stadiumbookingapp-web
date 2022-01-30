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

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.model.User;
import com.stadiumbooking.model.WalletDetails;

@WebServlet("/allUserWalletList")
public class AllUserWalletListController extends HttpServlet {
	
	static final WalletDaoImpl walletDao=new WalletDaoImpl();
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		try {
		    List<WalletDetails> walletList=walletDao.allUserWalletList();
			 
		    req.setAttribute("walletList", walletList);
			   
		
		      RequestDispatcher rd = req.getRequestDispatcher("allUserWalletList.jsp");			
					rd.forward(req, res);
		} catch (SQLException | ServletException | IOException e) {
			
			e.getMessage();
		}
		
	
	}

}
