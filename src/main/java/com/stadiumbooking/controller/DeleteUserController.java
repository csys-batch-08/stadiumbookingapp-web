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
import com.stadiumbooking.model.User;
import com.stadiumbooking.service.impl.UserServiceImpl;


@WebServlet("/deleteUser")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static final UserServiceImpl userService=new UserServiceImpl();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

		
		try {
			int userId=Integer.parseInt(req.getParameter("userId"));
			    int row=userService.deleteUser(userId);
			  if(row==1) {
			    List<User> userLists= userService.getAllUser();
			    req.setAttribute("delete", "deleted");
			 req.setAttribute("UserLists", userLists);
		
		      RequestDispatcher rd = req.getRequestDispatcher("getallusers.jsp");			
					rd.forward(req, res);
			  }
		} catch (SQLException | ServletException | IOException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}catch(NumberFormatException  e1) {
			Logger.printStackTrace(e1);
			Logger.runTimeException(e1.getMessage());
		}
		
		
	
	}

}
