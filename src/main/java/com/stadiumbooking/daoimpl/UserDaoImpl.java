package com.stadiumbooking.daoimpl;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Scanner;

import com.stadiumbooking.connection.ConnectionUtill;

import com.stadiumbooking.dao.UserDao;
import com.stadiumbooking.exception.SomthingWentWrong;
import com.stadiumbooking.model.User;



public class UserDaoImpl  implements UserDao  {


	@Override
	public int insertUser(User user) throws ClassNotFoundException, SQLException {

		/* Insert User Details Into database */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String query="insert into users( name, username, role,password, email, phoneNumber) values(?,?,?,?,?,?)";
		
		PreparedStatement stmt=con.prepareStatement(query);
	
		//System.out.println(user.getName()+user.getEmail());
		stmt.setString(1, user.getName());
		stmt.setString(2, user.getUsername());
		stmt.setString(3, "User");
		stmt.setString(4, user.getPassword());
		stmt.setString(5, user.getEmail());
		stmt.setLong(6, user.getPhoneNumber());
	    int i=stmt.executeUpdate();
		return i;
		
	}

	@Override
	public ResultSet getAllUser() throws ClassNotFoundException, SQLException {

		/* Get All User Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="select * from users order by userid";
		
		ResultSet rs=stmt.executeQuery(query);

		
		return rs;
		
	}

	@Override
	public ResultSet getUserById(int id) throws ClassNotFoundException, SQLException {
		/* Get Single  User details  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		

		//System.out.println("Dao"+id);
		
		String query="Select * from users where userid=?";		

		PreparedStatement stmt1=con.prepareStatement(query);		
		stmt1.setInt(1, id);
		ResultSet rs2=stmt1.executeQuery();
	
		return rs2;
	
		
	}

	@Override
	public void updateUser(User user) throws ClassNotFoundException, SQLException {
		/* Update User details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		//System.out.println("DAOOOOO\n"+user.getName()+"\n"+user.getUsername()+"\n"+user.getUserid()+user.getPassword()+user.getEmail()+user.getPhoneNumber()+"\n"+"DAOOOO");
			String que = "update users set name=?,username=?,password=?,email=?, phoneNumber=? where userid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			pstmt.setLong(5, user.getPhoneNumber());
			pstmt.setInt(6, user.getUserid());
			int i=pstmt.executeUpdate();
			//System.out.println(i+" Updated");
		
		
	}

	@Override
	public void deleteUser(int userId) throws ClassNotFoundException, SQLException {
		/* Delete Single User */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();

		
		String que = "delete from users where userId=?";
		PreparedStatement pstmt = con.prepareStatement(que);
		
		pstmt.setInt(1, userId);
		int i=pstmt.executeUpdate();
		//System.out.println(i+" deleted");
		
	}

	@Override
	public ResultSet validateUser(String username,String password) throws ClassNotFoundException, SQLException {
		/* Get a Available User details from database  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
	
		String query="Select * from users where username=? and password=?";		

		PreparedStatement stmt1=con.prepareStatement(query);
		stmt1.setString(1, username);
		stmt1.setString(2,password);
		ResultSet rs=stmt1.executeQuery();
		
		return rs;
		
	}

	@Override
	public boolean checkUser(String username, String password) throws ClassNotFoundException, SQLException {

		/* Check The User details Exits or not in the database */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
	
		String query="Select * from users where username=? and password=?";		

		PreparedStatement stmt1=con.prepareStatement(query);
		stmt1.setString(1, username);
		stmt1.setString(2,password);
		int i=stmt1.executeUpdate();
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	
	}

	@Override
	public void addAmount(int userId, double amount) throws ClassNotFoundException, SQLException {
		/* Insert user wallet details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
	    String que = "update users set wallet=wallet+? where userid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, userId);
			int i=pstmt.executeUpdate();
			//System.out.println(i+" Updated");
		
	}

	@Override
	public void refundPice(int userId, double amount) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		/* Update user wallet if user cancelled tickets  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
	    String que = "update users set wallet=(wallet+(?*.90)) where userid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, userId);
			int i=pstmt.executeUpdate();
			//System.out.println(i+" Updated");
	}

	@Override
	public void bookingTicktes(int userid, double amount) throws ClassNotFoundException, SQLException {
		/* Update User wallet if he/she buy a ticket  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
	    String que = "update users set wallet=wallet-? where userid=?";
	   
			PreparedStatement pstmt = con.prepareStatement(que);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, userid);
			int i=pstmt.executeUpdate();
			//System.out.println(i+" Updated");
		
		
	}

	@Override
	public Double userWalletDetails(int userid) throws ClassNotFoundException, SQLException {
	/* Get Single  User Wallet details  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
				
		String query="Select * from users where userid=?";		

		PreparedStatement stmt1=con.prepareStatement(query);		
		stmt1.setInt(1, userid);
		ResultSet rs2=stmt1.executeQuery();
		if(rs2.next()) {
	    Double amount= rs2.getDouble(8);
	    
		return amount;
		
	}
		return (double) 0;


	}

	@Override
	public void updateUserProfilePic(int userid, String pic) throws ClassNotFoundException, SQLException {
		// Update Profile Pictuer by User
		

		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
	    String que = "update users set profilePic=? where userid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
			pstmt.setString(1, pic);
			pstmt.setInt(2, userid);
			int i=pstmt.executeUpdate();
			//System.out.println(i+" Updated");
		
	}

	@Override
	public String getUserNamebyId(int userid) throws ClassNotFoundException, SQLException {

		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
				
		String query="Select name from users where userid=?";		

		PreparedStatement stmt1=con.prepareStatement(query);		
		stmt1.setInt(1, userid);
		ResultSet rs2=stmt1.executeQuery();
		String name=null;
		if(rs2.next()) {
	    name= rs2.getString(1);
	    
		return name;
		
	}
		return name;


	}

	@Override
	public boolean checkUser(String userName, String email, Long phone) throws ClassNotFoundException, SQLException {
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		

		//System.out.println("Dao"+id);
		
		String query="Select * from users where username=? or email=? or phoneNumber=?";		

		PreparedStatement stmt1=con.prepareStatement(query);		
		stmt1.setString(1, userName);
		stmt1.setString(2, email);
		stmt1.setLong(3, phone);
		ResultSet rs2=stmt1.executeQuery();
		
		if(rs2.next()) {
		return false;
		}
		else {
			return true;
		}
	}

	
}