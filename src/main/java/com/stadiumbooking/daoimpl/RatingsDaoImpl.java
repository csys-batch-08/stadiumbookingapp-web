package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.RatingsDao;
import com.stadiumbooking.model.Ratings;

public class RatingsDaoImpl implements RatingsDao {

	static final String REVIEWID="REVIEWID";
	static final String USERID="USERID";
	static final String REVIEWS="REVIEWS";
	static final String RATINGS="RATINGS";
	static final String STADIUM_ID="STADIUM_ID";
	
	@Override
	public void ratingStadium(Ratings ratings) throws SQLException {

		/* Insert Rating details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = conUtil.getDBConnect();

			String query = "insert into ratings (userId,reviews,ratings,stadium_id) values(?,?,?,?)";
			stmt = con.prepareStatement(query);
			stmt.setInt(1, ratings.getUserId());
			stmt.setString(2, ratings.getReviews());
			stmt.setDouble(3, ratings.getRatingValue());
			stmt.setInt(4, ratings.getStadiumId());
			stmt.executeUpdate();
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

	}

	@Override
	public List<Ratings> getAllRatingsById(int stadiumid) throws SQLException {

		/* Get Single Users all Rating Details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt1 = null;
		ResultSet rs = null;
		List<Ratings> ratingList = null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select REVIEWID,USERID,REVIEWS,RATINGS,STADIUM_ID from Ratings where stadium_id=?";
			stmt1 = con.prepareStatement(query);
			stmt1.setInt(1, stadiumid);
			rs = stmt1.executeQuery();
			ratingList = new ArrayList<>();
			while (rs.next()) {
				Ratings ratings = new Ratings(rs.getInt(REVIEWID), rs.getInt(USERID), rs.getString(REVIEWS), rs.getDouble(RATINGS),
						rs.getInt(STADIUM_ID));
				ratingList.add(ratings);
			}
			return ratingList;

		} catch (ClassNotFoundException | SQLException e) {

			e.getMessage();
		}

		finally {
		
			if (stmt1 != null) {
				stmt1.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return ratingList;

	}

	@Override
	public List<Ratings> getAllRatings() throws  SQLException {

		/* Getting All Rating Details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Ratings> ratingList = null;
		try {
			con = conUtil.getDBConnect();
              
			String query = "Select REVIEWID,USERID,REVIEWS,RATINGS,STADIUM_ID  from Ratings";

			stmt = con.prepareStatement(query);
			 rs = stmt.executeQuery(query);
			 ratingList = new ArrayList<>();
			while (rs.next()) {
				Ratings ratings = new Ratings(rs.getInt(REVIEWID), rs.getInt(USERID), rs.getString(REVIEWS), rs.getDouble(RATINGS),
						rs.getInt(STADIUM_ID));
				ratingList.add(ratings);
			}
			return ratingList;
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
		}finally {
			
			if (stmt != null) {
				stmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return ratingList;

	

	}

}
