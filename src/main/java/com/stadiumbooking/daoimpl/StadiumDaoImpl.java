package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.StadiumDao;
import com.stadiumbooking.model.Stadium_detalis;

public class StadiumDaoImpl implements StadiumDao {

	@Override
	public ResultSet getAllStadiumList() throws ClassNotFoundException, SQLException {
		
		/* Get All Stadium Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select * from stadium_detalis";
		
		ResultSet rs=stmt.executeQuery(query);

		
		return rs;
	}

	@Override
	public void insertStadium(Stadium_detalis stadium) {
		
		/* Insert Stadium Details Into database  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con;
		try {
			con = conUtil.getDBConnect();
			//System.out.println("Insert Process");
			String query="insert into stadium_detalis(stadium_name,stadium_img) values(?,?)";
		
			PreparedStatement stmt=con.prepareStatement(query);
			stmt.setString(1, stadium.getStadium_name());
			stmt.setString(2, stadium.getStadium_img());
			int i=stmt.executeUpdate();
			//System.out.println(i+" row Inserted");
			//System.out.println("Value Inserted Successfully");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

}
