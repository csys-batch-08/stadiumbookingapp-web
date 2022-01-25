package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.StadiumDao;
import com.stadiumbooking.model.StadiumDetalis;

public class StadiumDaoImpl implements StadiumDao {

	@Override
	public List<StadiumDetalis> getAllStadiumList() throws ClassNotFoundException, SQLException {
		
		/* Get All Stadium Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select STADIUM_ID,STADIUM_NAME,STADIUM_IMG  from stadium_detalis";
		
		ResultSet rs=stmt.executeQuery(query);
		
		List<StadiumDetalis> StadiumList=new ArrayList<StadiumDetalis>();

		while(rs.next()) {
			StadiumDetalis stadium=new StadiumDetalis(rs.getInt(1),rs.getString(2),rs.getString(3));
			StadiumList.add(stadium);
		}
		
		return StadiumList;
	}

	@Override
	public void insertStadium(StadiumDetalis stadium) {
		
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
