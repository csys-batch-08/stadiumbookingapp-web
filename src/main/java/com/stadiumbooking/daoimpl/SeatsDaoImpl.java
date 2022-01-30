package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.SeatsDao;
import com.stadiumbooking.model.Seats;

public class SeatsDaoImpl implements SeatsDao {

	@Override
	public void bookingSeats(Seats seats) throws SQLException {
		
		/*  Insert Seat Deatils into database */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt=null;
		try {
			con = conUtil.getDBConnect();
			String query="insert into seat_details(userid,ticket_numbers,match_id,seatclass,Totalpirce,seatcount) values(?,?,?,?,?,?)";
			
			 stmt=con.prepareStatement(query);
			
			stmt.setInt(1, seats.getUserid());
			stmt.setString(2, seats.getTicketNumbers());
			stmt.setInt(3, seats.getMatchId());
			stmt.setString(4, seats.getSeatclass());
			stmt.setInt(5, seats.getPrice());
			stmt.setInt(6, seats.getSeatcount());
			stmt.executeUpdate();
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
		
		
	
		
	}

	@Override
	public List<Seats> getSeatById(int userId) throws  SQLException {
		
		/* Getting Single User Booking Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con = null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		List<Seats> seatList=null;
		try {
			con = conUtil.getDBConnect();
			String query="select TICKETID,USERID,TICKET_NUMBERS,MATCH_ID,SEATCLASS,TOTALPIRCE,SEATCOUNT,STATUS from seat_details where userid=?";
			pst=con.prepareStatement(query);
			pst.setInt(1, userId);
			rs=pst.executeQuery();
			seatList=new ArrayList<>();
			while(rs.next()) {
				Seats seat=new Seats(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getString(8));
			seatList.add(seat);
			}
			return seatList;
		} catch (ClassNotFoundException | SQLException e) {
			
			e.getMessage();
		}
		finally {	
		
			if(pst!=null) {
			pst.close();     	
			}
			if(con !=null) {
			con.close();
			}
			}
		return seatList;

		

	}

	@Override
	public List<Seats> getSeatsDetalis() throws  SQLException {
		/*Getting Booking Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		List<Seats> seatList=null;
		try {
			con = conUtil.getDBConnect();
			 
			String query="select TICKETID,USERID,TICKET_NUMBERS,MATCH_ID,SEATCLASS,TOTALPIRCE,SEATCOUNT,STATUS from seat_details";
			stmt=con.prepareStatement(query);
			 rs=stmt.executeQuery(query);
			seatList=new ArrayList<>();
			while(rs.next()) {
				Seats seat=new Seats(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getString(8));
			seatList.add(seat);
			}
			return seatList;
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
		return seatList;
		
	}

	@Override
	public void cancelledSeats(int ticketId) throws  SQLException {
		
		/* Update Seat Details If user cancelled tickets */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con = null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt1=null;

		try {
			con = conUtil.getDBConnect();
			String que = "update seat_details set Status=? where ticketid=?";
			 pstmt = con.prepareStatement(que);
			pstmt.setString(1, "Cancelled");
			pstmt.setInt(2, ticketId);
		
			pstmt.executeUpdate();

			
			/* Update Available Seats and Amount Details If User Cancelled Tickets */
			
			String query="select match_id,seatcount,Totalpirce,userid from seat_details where ticketid=?";
			pstmt1=con.prepareStatement(query);
			pstmt1.setInt(1, ticketId);
			ResultSet rs=pstmt1.executeQuery();
			
			int matchId;
			int seatcounts;
			double price;
			int userid;
			if(rs.next()) {
				matchId=rs.getInt(1);
				seatcounts=rs.getInt(2);
				price=rs.getDouble(3);
				userid=rs.getInt(4);
				MatchDaoImpl matchDao=new MatchDaoImpl();
				matchDao.updateCancelledSeats(seatcounts, matchId);
				UserDaoImpl userDao=new UserDaoImpl();
				userDao.refundPice(userid,price);	
			}
		} catch (ClassNotFoundException | SQLException e) {
		
			e.getMessage();
		}finally {	
			if(pstmt!=null) {
			pstmt.close();     	
			}
			if(pstmt1!=null) {
				pstmt1.close();     	
				}
			if(con !=null) {
			con.close();
			}
			}
		
		
		
	}

	
}
