package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.daoimpl.SportsDaoImpl;
import com.stadiumbooking.model.Match;


@WebServlet("/matchServe")
public class MatchController  extends HttpServlet{
	
	MatchDaoImpl matchDao=new MatchDaoImpl();
	
	public void service(HttpServletRequest req, HttpServletResponse res) {
	
		SportsDaoImpl sportsDao=new SportsDaoImpl();
		
		/*  Getting Macth Details */
		
		String stdName=req.getParameter("stdname").trim();
		//System.out.println(stdName);
		String location=req.getParameter("location");
		//System.out.println(location);
		String sportsName=req.getParameter("spname");
		//System.out.println(sportsName);
		String eventName=req.getParameter("event");
		//System.out.println(eventName);
		int spid = 0;
		try {
			spid = sportsDao.getSportsId(sportsName, eventName);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
				
	    //  System.out.println(spid);
	
		String teamA=req.getParameter("teamA");
         // System.out.println(teamA);
         String teamB=req.getParameter("teamB");
         //System.out.println(teamB);
		String teamAlogo=req.getParameter("teamAlogo");
		//System.out.println(teamAlogo);
		String teamBlogo=req.getParameter("teamBlogo");
		//System.out.println(teamBlogo);
		int totalseats=Integer.parseInt(req.getParameter("totalSeats"));
		//System.out.println(totalseats);
		int availSeats=Integer.parseInt(req.getParameter("availseats"));
		//System.out.println(availSeats);
		int fClass=Integer.parseInt(req.getParameter("firstClass"));
		//System.out.println(fClass);
		int sClass=Integer.parseInt(req.getParameter("secondClass" ));
		//System.out.println(sClass);
	      String dateInString = req.getParameter("matchDate");
		
		
		try {
			//System.out.println(dateInString);
			LocalDate date = LocalDate.parse(dateInString);
			//System.out.println(date);
			String timeInString=req.getParameter("time");
			LocalTime time=LocalTime.parse(timeInString);
			Match match=new Match(spid,stdName,location,date,time,teamA,teamB,teamAlogo,teamBlogo,totalseats,availSeats,fClass,sClass);
			matchDao.insertMatchDetalis(match);
			res.sendRedirect("showMatchToAdmin.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
