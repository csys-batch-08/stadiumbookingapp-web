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
import com.stadiumbooking.model.StadiumDetalis;



@WebServlet("/stadium")
public class StadiumController extends HttpServlet {

	final StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) {
		
		/*Getting StadiumDetails */
		
		String stadiumName=req.getParameter("stadiumName");
		String stadiumImage=req.getParameter("stadiumImge");
		
		StadiumDetalis stadium=new StadiumDetalis(0,stadiumName,stadiumImage);
	
		
		try {
			stadiumDao.insertStadium(stadium);
			List<StadiumDetalis> stadiumList=stadiumDao.getAllStadiumList();
			req.setAttribute("stadiumList", stadiumList);
		
		      RequestDispatcher rd = req.getRequestDispatcher("stadiumList.jsp");			
					rd.forward(req, res);
		} catch (IOException e) {
		
			e.printStackTrace();
		} catch (SQLException e2) {

			e2.printStackTrace();
		} catch (ServletException e3) {
			
			e3.printStackTrace();
		}
	}
}

