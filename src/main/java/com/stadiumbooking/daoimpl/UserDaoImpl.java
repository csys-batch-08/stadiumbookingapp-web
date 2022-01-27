package com.stadiumbooking.daoimpl;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
	
		stmt.setString(1, user.getName());
		stmt.setString(2, user.getUsername());
		stmt.setString(3, "User");
		stmt.setString(4, user.getPassword());
		stmt.setString(5, user.getEmail());
		stmt.setLong(6, user.getPhoneNumber());
	    return stmt.executeUpdate();
		
	}

	@Override
	public List<User> getAllUser() throws ClassNotFoundException, SQLException {

		/* Get All User Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		List<User> userList=new ArrayList<>();
		String query="select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users order by userid";
		PreparedStatement stmt=con.prepareStatement(query);	
		ResultSet rs=stmt.executeQuery(query);
		
		while(rs.next()) {
		

			User user=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getLong(7),rs.getDouble(8),rs.getString(9));
			userList.add(user);
		}

		
		return userList;
		
	}

	@Override
	public List<User> getUserById(int id) throws ClassNotFoundException, SQLException {
		/* Get Single  User details  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		String query="Select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users where userid=?";		

		PreparedStatement stmt1=con.prepareStatement(query);		
		stmt1.setInt(1, id);
        ResultSet rs=stmt1.executeQuery();
        List<User> userList=new ArrayList<>();
		if(rs.next()) {
	
			User user=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getLong(7),rs.getDouble(8),rs.getString(9));
			userList.add(user);
		}
		return userList;
	
		
	}

	@Override
	public void updateUser(User user) throws ClassNotFoundException, SQLException {
		/* Update User details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();

			String que = "update users set name=?,username=?,password=?,email=?, phoneNumber=? where userid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			pstmt.setLong(5, user.getPhoneNumber());
			pstmt.setInt(6, user.getUserid());
			pstmt.executeUpdate();
					
		
	}

	@Override
	public void deleteUser(int userId) throws ClassNotFoundException, SQLException {
		/* Delete Single User */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String que = "delete from users where userId=?";
		PreparedStatement pstmt = con.prepareStatement(que);
		
		pstmt.setInt(1, userId);
		pstmt.executeUpdate();
		
		
	}

	@Override
	public List<User> validateUser(String username,String password) throws ClassNotFoundException, SQLException {
		/* Get a Available User details from database  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
	
		String query="Select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users where username=? and password=?";		

		PreparedStatement stmt1=con.prepareStatement(query);
		stmt1.setString(1, username);
		stmt1.setString(2,password);
		ResultSet rs=stmt1.executeQuery();
		  List<User> userList=new ArrayList<User>();
			while(rs.next()) {
			

				User user=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getLong(7),rs.getDouble(8),rs.getString(9));
				userList.add(user);
			}
			return userList;
		
	}

	@Override
	public boolean checkUser(String username, String password) throws ClassNotFoundException, SQLException {

		/* Check The User details Exits or not in the database */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
	
		String query="Select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users where username=? and password=?";		

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
            pstmt.executeUpdate();
			
		
	}

	@Override
	public void refundPice(int userId, double amount) throws ClassNotFoundException, SQLException {
	
		/* Update user wallet if user cancelled tickets  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
	    String que = "update users set wallet=(wallet+(?*.90)) where userid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, userId);
			pstmt.executeUpdate();
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
            pstmt.executeUpdate();
			
		
		
	}

	@Override
	public Double userWalletDetails(int userid) throws ClassNotFoundException, SQLException {
	/* Get Single  User Wallet details  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
				
		String query="Select WALLET from users where userid=?";		

		PreparedStatement stmt1=con.prepareStatement(query);		
		stmt1.setInt(1, userid);
		ResultSet rs2=stmt1.executeQuery();
		if(rs2.next()) {
	    
		return rs2.getDouble(1);
		
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
			pstmt.executeUpdate();
		
		
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
	    
		return rs2.getString(1);
	}
		return name;


	}

	@Override
	public boolean checkUser(String userName, String email, Long phone) throws ClassNotFoundException, SQLException {
		
		/* Checking Weather the user alredy registered or Not  */
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
				
		String query="Select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users where username=? or email=? or phoneNumber=?";		

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