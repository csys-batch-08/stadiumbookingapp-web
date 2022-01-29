package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.SportsDao;
import com.stadiumbooking.model.Ratings;
import com.stadiumbooking.model.Sports;

public class SportsDaoImpl implements SportsDao {

	@Override
	public int getSportsId(String sportsName, String eventName) throws SQLException {

		/* Get Sports ID by Sports Name and Event Name */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			con = conUtil.getDBConnect();
			String query = "select SPORTSID,SPORTSNAME,EVENTNAME from sports_info where sportsName=? and eventName=?";

			stmt = con.prepareStatement(query);
			stmt.setString(1, sportsName);
			stmt.setString(2, eventName);
			rs = stmt.executeQuery();
			num = 0;
			if (rs.next()) {
				num = rs.getInt(1);

			}

			return num;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
		
			if (stmt != null) {
				stmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return num;

	}

	@Override
	public void insertSports(Sports sports) throws SQLException {

		/* Insert Sports Details into database */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = conUtil.getDBConnect();
			String query = "insert into sports_info(sportsName,eventName ) values(?,?)";

			stmt = con.prepareStatement(query);
			stmt.setString(1, sports.getSportsName());
			stmt.setString(2, sports.getEventName());
			stmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}

		finally {

			if (stmt != null) {
				stmt.close();
			}
			if (con != null) {
				con.close();
			}
		}

	}

	@Override
	public List<Sports> getAllSports() throws SQLException {

		/* Get All Sports Details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		List<Sports> sportsList=null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select SPORTSID,SPORTSNAME,EVENTNAME from sports_info";

			 stmt = con.prepareStatement(query);
			 rs = stmt.executeQuery(query);
			sportsList = new ArrayList<>();
			while (rs.next()) {
				Sports sports = new Sports(rs.getInt(1), rs.getString(2), rs.getString(3));
				sportsList.add(sports);
			}
			return sportsList;
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}finally {	
			
			if(stmt!=null) {
			stmt.close();     	
			}
			if(con !=null) {
			con.close();
			}
			}
		return sportsList;

		

	}

}
