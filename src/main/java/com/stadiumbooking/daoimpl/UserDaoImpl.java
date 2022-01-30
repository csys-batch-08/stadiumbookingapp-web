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

public class UserDaoImpl implements UserDao {

	@Override
	public int insertUser(User user) throws SQLException {

		/* Insert User Details Into database */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = conUtil.getDBConnect();
			String query = "insert into users( name, username, role,password, email, phoneNumber) values(?,?,?,?,?,?)";

			stmt = con.prepareStatement(query);

			stmt.setString(1, user.getName());
			stmt.setString(2, user.getUsername());
			stmt.setString(3, "User");
			stmt.setString(4, user.getPassword());
			stmt.setString(5, user.getEmail());
			stmt.setLong(6, user.getPhoneNumber());
			return stmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {

			e.getMessage();
		} finally {

			if (stmt != null) {
				stmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return 0;

	}

	@Override
	public List<User> getAllUser() throws SQLException {

		/* Get All User Details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<User> userList = null;
		try {
			con = conUtil.getDBConnect();

			String query = "select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users order by userid";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery(query);

			userList = new ArrayList<>();
			while (rs.next()) {

				User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getLong(7), rs.getDouble(8), rs.getString(9));
				userList.add(user);
			}

			return userList;

		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
		} finally {

			if (stmt != null) {
				stmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return userList;

	}

	@Override
	public List<User> getUserById(int id) throws SQLException {
		/* Get Single User details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt1 = null;
		ResultSet rs = null;
		List<User> userList = null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users where userid=?";

			stmt1 = con.prepareStatement(query);
			stmt1.setInt(1, id);
			rs = stmt1.executeQuery();
			userList = new ArrayList<>();
			if (rs.next()) {

				User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getLong(7), rs.getDouble(8), rs.getString(9));
				userList.add(user);
			}
			return userList;
		} catch (ClassNotFoundException | SQLException e) {

			e.getMessage();
		} finally {
			
			if (stmt1 != null) {
				stmt1.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return userList;

	}

	@Override
	public void updateUser(User user) throws SQLException {
		/* Update User details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = conUtil.getDBConnect();
			String que = "update users set name=?,username=?,password=?,email=?, phoneNumber=? where userid=?";
			pstmt = con.prepareStatement(que);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			pstmt.setLong(5, user.getPhoneNumber());
			pstmt.setInt(6, user.getUserid());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
		} finally {

			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}

	}

	@Override
	public void deleteUser(int userId) throws SQLException {
		/* Delete Single User */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = conUtil.getDBConnect();
			String que = "delete from users where userId=?";
			pstmt = con.prepareStatement(que);
			pstmt.setInt(1, userId);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {

			e.getMessage();
		} finally {

			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}

	}

	@Override
	public List<User> validateUser(String username, String password) throws SQLException {
		/* Get a Available User details from database */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt1 = null;
		ResultSet rs = null;
		List<User> userList = null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users where username=? and password=?";

			stmt1 = con.prepareStatement(query);
			stmt1.setString(1, username);
			stmt1.setString(2, password);
			rs = stmt1.executeQuery();
			userList = new ArrayList<>();
			while (rs.next()) {

				User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getLong(7), rs.getDouble(8), rs.getString(9));
				userList.add(user);
			}
			return userList;

		} catch (ClassNotFoundException | SQLException e) {

			e.getMessage();
		} finally {

			if (stmt1 != null) {
				stmt1.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return userList;

	}

	@Override
	public boolean checkUser(String username, String password) throws SQLException {

		/* Check The User details Exits or not in the database */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt1 = null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users where username=? and password=?";

			stmt1 = con.prepareStatement(query);
			stmt1.setString(1, username);
			stmt1.setString(2, password);
			int i = stmt1.executeUpdate();
			if (i > 0) {
				return true;
			} else {
				return false;
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
		} finally {

			if (stmt1 != null) {
				stmt1.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return false;

	}

	@Override
	public void addAmount(int userId, double amount) throws SQLException {
		/* Insert user wallet details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = conUtil.getDBConnect();
			String que = "update users set wallet=wallet+? where userid=?";
			pstmt = con.prepareStatement(que);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, userId);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
		} finally {

			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}

	}

	@Override
	public void refundPice(int userId, double amount) throws SQLException {

		/* Update user wallet if user cancelled tickets */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = conUtil.getDBConnect();
			String que = "update users set wallet=(wallet+(?*.90)) where userid=?";
			pstmt = con.prepareStatement(que);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, userId);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
		} finally {

			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}

	}

	@Override
	public void bookingTicktes(int userid, double amount) throws SQLException {
		/* Update User wallet if he/she buy a ticket */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = conUtil.getDBConnect();

			String que = "update users set wallet=wallet-? where userid=?";

			pstmt = con.prepareStatement(que);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, userid);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
		} finally {

			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}

	}

	@Override
	public Double userWalletDetails(int userid) throws SQLException {
		/* Get Single User Wallet details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt1 = null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select WALLET from users where userid=?";

			stmt1 = con.prepareStatement(query);
			stmt1.setInt(1, userid);
			ResultSet rs2 = stmt1.executeQuery();
			if (rs2.next()) {

				return rs2.getDouble(1);

			}
		} catch (ClassNotFoundException | SQLException e) {

			e.getMessage();
		} finally {

			if (stmt1 != null) {
				stmt1.close();
			}
			if (con != null) {
				con.close();
			}
		}

		return (double) 0;

	}

	@Override
	public void updateUserProfilePic(int userid, String pic) throws SQLException {
		// Update Profile Pictuer by User

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = conUtil.getDBConnect();
			String que = "update users set profilePic=? where userid=?";
			pstmt = con.prepareStatement(que);
			pstmt.setString(1, pic);
			pstmt.setInt(2, userid);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
		} finally {

			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}

	}

	@Override
	public String getUserNamebyId(int userid) throws SQLException {

		ConnectionUtill conUtil = new ConnectionUtill();
		String name = null;
		Connection con = null;
		PreparedStatement stmt1 = null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select name from users where userid=?";

			stmt1 = con.prepareStatement(query);
			stmt1.setInt(1, userid);
			ResultSet rs2 = stmt1.executeQuery();

			if (rs2.next()) {

				return rs2.getString(1);
			}
		} catch (ClassNotFoundException | SQLException e) {

			e.getMessage();
		} finally {

			if (stmt1 != null) {
				stmt1.close();
			}
			if (con != null) {
				con.close();
			}
		}

		return name;

	}

	@Override
	public boolean checkUser(String userName, String email, Long phone) throws SQLException {

		/* Checking Weather the user alredy registered or Not */
		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt1=null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select USERID,NAME,USERNAME,ROLE,PASSWORD,EMAIL,PHONENUMBER,WALLET,PROFILEPIC from users where username=? or email=? or phoneNumber=?";

			stmt1 = con.prepareStatement(query);
			stmt1.setString(1, userName);
			stmt1.setString(2, email);
			stmt1.setLong(3, phone);
			ResultSet rs2 = stmt1.executeQuery();

			if (rs2.next()) {
				return false;
			} else {
				return true;
			}
		} catch (ClassNotFoundException | SQLException e) {

			e.getMessage();
		} finally {

			if (stmt1!= null) {
				stmt1.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return false;

	}

}