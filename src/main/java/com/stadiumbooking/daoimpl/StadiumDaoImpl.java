package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.StadiumDao;
import com.stadiumbooking.model.StadiumDetalis;

public class StadiumDaoImpl implements StadiumDao {

	@Override
	public List<StadiumDetalis> getAllStadiumList() throws SQLException {
		
		/* Get All Stadium Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		List<StadiumDetalis> stadiumList=null;
		try {
			con = conUtil.getDBConnect();
			String query="Select STADIUM_ID,STADIUM_NAME,STADIUM_IMG  from stadium_detalis";

			stmt=con.prepareStatement(query);
			 rs=stmt.executeQuery(query);
			
			 stadiumList=new ArrayList<>();

			while(rs.next()) {
				StadiumDetalis stadium=new StadiumDetalis(rs.getInt(1),rs.getString(2),rs.getString(3));
				stadiumList.add(stadium);
			}
			
			return stadiumList;
		} catch (ClassNotFoundException | SQLException e) {
		
			e.getMessage();
		}
		finally {	
		
			if(stmt!=null) {
			stmt.close();     	
			}
			if(con !=null) {
			con.close();
			}
			}
		return stadiumList;

		
	}

	@Override
	public void insertStadium(StadiumDetalis stadium) throws SQLException {
		
		/* Insert Stadium Details Into database  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt=null;
		try {
			con = conUtil.getDBConnect();
			
			String query="insert into stadium_detalis(stadium_name,stadium_img) values(?,?)";
		
			stmt=con.prepareStatement(query);
			stmt.setString(1, stadium.getStadiumName());
			stmt.setString(2, stadium.getStadiumImg());
			stmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
		}finally {	
			
			if(stmt!=null) {
			stmt.close();     	
			}
			if(con !=null) {
			con.close();
			}
			}
	
		
	}

}
