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

import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.model.StadiumDetalis;
import com.stadiumbooking.model.WalletDetails;

@WebServlet("/stadiumList")
public class StadiumListController extends HttpServlet {
	
	final StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		try {
			List<StadiumDetalis> stadiumList=stadiumDao.getAllStadiumList();
			req.setAttribute("stadiumList", stadiumList);
		
		      RequestDispatcher rd = req.getRequestDispatcher("stadiumList.jsp");			
					rd.forward(req, res);
		} catch (ClassNotFoundException | SQLException | ServletException | IOException e) {
			
			e.printStackTrace();
		}
		
	
	}

}
