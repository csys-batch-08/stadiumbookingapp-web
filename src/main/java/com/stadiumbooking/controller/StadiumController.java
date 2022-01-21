package com.stadiumbooking.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.model.Stadium_detalis;



@WebServlet("/stadium")
public class StadiumController extends HttpServlet {

	
	public void service(HttpServletRequest req, HttpServletResponse res) {
		
		/*Getting StadiumDetails */
		
		String stadiumName=req.getParameter("stadiumName");
		String stadiumImage=req.getParameter("stadiumImge");
		
		Stadium_detalis stadium=new Stadium_detalis(stadiumName,stadiumImage);
		StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
		
		try {
			stadiumDao.insertStadium(stadium);
			res.sendRedirect("stadiumDetalis.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

