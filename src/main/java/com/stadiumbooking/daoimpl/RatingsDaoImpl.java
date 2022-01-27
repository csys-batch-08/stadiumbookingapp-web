package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
		stmt.setDouble(3, ratings.getRatingValue());
		stmt.setInt(4, ratings.getStadiumId());
		stmt.executeUpdate();
			}

	@Override
	public List<Ratings> getAllRatingsById(int stadiumid) throws ClassNotFoundException, SQLException {
		
		/*Get Single Users all Rating Details  */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();		
		
		String query="Select REVIEWID,USERID,REVIEWS,RATINGS,STADIUM_ID from Ratings where stadium_id=?";
		PreparedStatement stmt1=con.prepareStatement(query);		
		stmt1.setInt(1, stadiumid);
		ResultSet rs=stmt1.executeQuery();
		List<Ratings> ratingList=new ArrayList<>();
		while(rs.next()) {
			Ratings ratings=new Ratings(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDouble(4),rs.getInt(5));
			ratingList.add(ratings);
		}
		return ratingList;

	}

	@Override
	public List<Ratings> getAllRatings() throws ClassNotFoundException, SQLException {
		
		/* Getting All  Rating Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select REVIEWID,USERID,REVIEWS,RATINGS,STADIUM_ID  from Ratings";
		
		ResultSet rs=stmt.executeQuery(query);
		List<Ratings> ratingList=new ArrayList<>();
		while(rs.next()) {
			Ratings ratings=new Ratings(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDouble(4),rs.getInt(5));
			ratingList.add(ratings);
		}
		return ratingList;

		
	}
	


}
