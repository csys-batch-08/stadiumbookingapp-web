package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.RatingsDao;
import com.stadiumbooking.model.Ratings;

public class RatingsDaoImpl implements RatingsDao {

	@Override
	public void ratingStadium(Ratings ratings) throws ClassNotFoundException, SQLException {
		
		/* Insert Rating details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String query="insert into ratings (userId,reviews,ratings,stadium_id) values(?,?,?,?)";
		PreparedStatement stmt=con.prepareStatement(query);
	
		stmt.setInt(1, ratings.getUserId());
		stmt.setString(2, ratings.getReviews());
		stmt.setDouble(3, ratings.getRatings());
		stmt.setInt(4, ratings.getStadium_id());
		int i=stmt.executeUpdate();
		//System.out.println(i+"row inserted");
	}

	@Override
	public ResultSet getAllRatingsById(int stadium_id) throws ClassNotFoundException, SQLException {
		
		/*Get Single Users all Rating Details  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		//System.out.println(stadium_id);
		
		String query="Select * from Ratings where stadium_id=?";
		PreparedStatement stmt1=con.prepareStatement(query);		
		stmt1.setInt(1, stadium_id);
		ResultSet rs2=stmt1.executeQuery();

		
		return rs2;
	}

	@Override
	public ResultSet getAllRatings() throws ClassNotFoundException, SQLException {
		
		/* Getting All  Rating Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select * from Ratings where stadium_id=?";
		
		ResultSet rs=stmt.executeQuery(query);
		return rs;

		
	}
	


}
