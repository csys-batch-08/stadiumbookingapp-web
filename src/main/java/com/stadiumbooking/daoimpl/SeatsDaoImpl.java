package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.SeatsDao;
import com.stadiumbooking.model.Seats;

public class SeatsDaoImpl implements SeatsDao {

	@Override
	public void bookingSeats(Seats seats) throws ClassNotFoundException, SQLException {
		
		/*  Insert Seat Deatils into database */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String query="insert into seat_details(userid,ticket_numbers,match_id,seatclass,Totalpirce,seatcount) values(?,?,?,?,?,?)";
		
		PreparedStatement stmt=con.prepareStatement(query);
		
		//System.out.println(seats.getUserid()+" wd  "+seats.getTicket_numbers());
		
		stmt.setInt(1, seats.getUserid());
		stmt.setString(2, seats.getTicket_numbers());
		stmt.setInt(3, seats.getMatch_id());
		stmt.setString(4, seats.getSeatclass());
		stmt.setInt(5, seats.getTotalpirce());
		stmt.setInt(6, seats.getSeatcount());
		int i=stmt.executeUpdate();
		//System.out.println(i+" row inserted");
		//System.out.println("Value Inserted Successfully");
		
		
		
		
	}

	@Override
	public ResultSet getSeatById(int userId) throws ClassNotFoundException, SQLException {
		
		/* Getting Single User Booking Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String query="select * from seat_details where userid=?";
		PreparedStatement pst=con.prepareStatement(query);
		pst.setInt(1, userId);
		ResultSet rs=pst.executeQuery();
		return rs;
	}

	@Override
	public ResultSet getSeatsDetalis() throws ClassNotFoundException, SQLException {
		/*Getting Booking Details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="select * from seat_details";
		
		ResultSet rs=stmt.executeQuery(query);
		return rs;
	}

	@Override
	public void cancelledSeats(int TicketId) throws ClassNotFoundException, SQLException {
		
		/* Update Seat Details If user cancelled tickets */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String que = "update seat_details set Status=? where ticketid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
			pstmt.setString(1, "Cancelled");
			pstmt.setInt(2, TicketId);
		
			int i=pstmt.executeUpdate();
			//System.out.println(i+" Updated");
			
			/* Update Available Seats and Amount Details If User Cancelled Tickets */
			
			String query="select match_id,seatcount,Totalpirce,userid from seat_details where ticketid=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setInt(1, TicketId);
			ResultSet rs=pst.executeQuery();
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
		
	}

	
}
