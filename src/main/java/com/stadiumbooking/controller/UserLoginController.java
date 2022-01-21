package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.exception.NotFound;
import com.stadiumbooking.model.User;






@WebServlet("/loginServe")
public class UserLoginController extends HttpServlet {
	
	UserDaoImpl userDao=new UserDaoImpl();
	public void service(HttpServletRequest req, HttpServletResponse res)  {
		
		/* User Login Details */
		User user=new User();
		
		String userName=req.getParameter("username").trim();
		String passWord=req.getParameter("password").trim();
		//System.out.println(userName);
		int id=0;
		try {
			boolean flag;
			
			flag=userDao.checkUser(userName, passWord);
			if(flag) {
			
			ResultSet rs= userDao.validateUser(userName, passWord);
			rs.next();
			String role=rs.getString(4);
			//System.out.println(role);
		
			
			int userID = rs.getInt(1);
			HttpSession session = req.getSession();
			session.setAttribute("id", userID);
			 //System.out.println(userID);
			rs.close();
			if(role.equals("Admin")) 
					{
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful", null);
				res.sendRedirect("adminHome.html");
				//res.sendRedirect("adminHome.html?userid=+rs.getInt(1));

			}
			else if(role.equals("User")) {
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful", null);
				res.sendRedirect("userHome.html");
			}
			
			}
			else {
				throw new NotFound();
//				HttpSession session = req.getSession();
//			 throw new NotFound();
//				session.setAttribute("error",error );
//				res.sendRedirect("index.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(IOException e) {
			System.out.println(e);
		} catch (NotFound e) {
			// TODO Auto-generated catch block
			try {
				HttpSession session = req.getSession();
				session.setAttribute("SomthingWentWrong", null);
				session.setAttribute("RegisterSuccessful",null);
					session.setAttribute("error",e.getMessage() );
				res.sendRedirect("index.jsp");
				
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				
				e1.printStackTrace();
			}
		}
	
	
		

		
		
		
	}
	
	
	
	            
	
}
