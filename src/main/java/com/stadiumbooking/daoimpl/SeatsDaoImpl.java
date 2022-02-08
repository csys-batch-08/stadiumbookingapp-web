package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.SeatsDao;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.Match;
import com.stadiumbooking.model.Seats;
import com.stadiumbooking.model.User;
import com.stadiumbooking.service.impl.MatchServiceImpl;
import com.stadiumbooking.service.impl.UserServiceImpl;

public class SeatsDaoImpl implements SeatsDao {
	
	static final UserServiceImpl userService=new UserServiceImpl();
	static final MatchServiceImpl matchService=new MatchServiceImpl();
	static final String TICKETID="TICKETID";
	static final String USERID="USERID";
	static final String TICKET_NUMBERS="TICKET_NUMBERS";
	static final String	MATCH_ID="MATCH_ID";
	static final String SEATCLASS="SEATCLASS";
	static final String TOTALPIRCE="TOTALPIRCE";
	static final String SEATCOUNT ="SEATCOUNT";
	static final String STATUS="STATUS";
	

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
			
			stmt.setInt(1, seats.getUser().getUserid());
			stmt.setString(2, seats.getTicketNumbers());
			stmt.setInt(3, seats.getMatch().getMatchId());
			stmt.setString(4, seats.getSeatclass());
			stmt.setInt(5, seats.getPrice());
			stmt.setInt(6, seats.getSeatcount());
			stmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
		
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
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
				User user=userService.getUserById(rs.getInt(USERID));
				
				Match match=matchService.getMatchByMatchId(rs.getInt(MATCH_ID));
				Seats seat=new Seats(rs.getInt(TICKETID),user,rs.getString(TICKET_NUMBERS),match,rs.getString(SEATCLASS),rs.getInt(TOTALPIRCE),
						rs.getInt(SEATCOUNT),rs.getString(STATUS));
			seatList.add(seat);
			}
			return seatList;
		} catch (ClassNotFoundException | SQLException e) {
			
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
		finally {	
		
			
			if(pst!=null) {
			pst.close();     	
			}
			if(rs != null) {
				rs.close();
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
				User user=userService.getUserById(rs.getInt(USERID));
				
				Match match=matchService.getMatchByMatchId(rs.getInt(MATCH_ID));
				Seats seat=new Seats(rs.getInt(TICKETID),user,rs.getString(TICKET_NUMBERS),match,rs.getString(SEATCLASS),rs.getInt(TOTALPIRCE),
						rs.getInt(SEATCOUNT),rs.getString(STATUS));
			seatList.add(seat);
			}
			return seatList;
		} catch (ClassNotFoundException | SQLException e) {
		
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}
		finally {	

			if(stmt!=null) {
			stmt.close();     	
			}
			if(rs != null) {
				rs.close();
			}
			if(con !=null) {
			con.close();
			}
			}
		return seatList;
		
	}

	@Override
	public int cancelledSeats(int ticketId) throws  SQLException {
		
		/* Update Seat Details If user cancelled tickets */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con = null;
		PreparedStatement pstmt=null;

		try {
			con = conUtil.getDBConnect();
			String que = "update seat_details set Status=? where ticketid=?";
			 pstmt = con.prepareStatement(que);
			pstmt.setString(1, "Cancelled");
			pstmt.setInt(2, ticketId);
		
			return pstmt.executeUpdate();

			
			
		} catch (ClassNotFoundException | SQLException e) {
		
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}finally {	
			if(pstmt!=null) {
			pstmt.close();     	
			}
			if(con !=null) {
			con.close();
			}
			}
		return 0;
		
		
		
	}

	@Override
	public void updateSeatsAndRefund(int ticketId) throws SQLException {
		/* Update Available Seats and Amount Details If User Cancelled Tickets */
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con = null;
		PreparedStatement pstmt1=null;
		ResultSet rs=null;
		
			try {
				con = conUtil.getDBConnect();
				String query="select match_id,seatcount,Totalpirce,userid from seat_details where ticketid=?";
				pstmt1=con.prepareStatement(query);
				pstmt1.setInt(1, ticketId);
				 rs=pstmt1.executeQuery();
				
				int matchId;
				int seatcounts;
				double price;
				int userid;
				if(rs.next()) {
					matchId=rs.getInt(MATCH_ID);
					seatcounts=rs.getInt(SEATCOUNT );
					price=rs.getDouble(TOTALPIRCE);
					userid=rs.getInt(USERID);
					matchService.updateCancelledSeats(seatcounts, matchId);
					userService.refundPice(userid,price);	
				}
			
			} catch (SQLException | ClassNotFoundException e) {
			
				Logger.printStackTrace(e);
				Logger.runTimeException(e.getMessage());
			}finally {	
				
				if(pstmt1!=null) {
				pstmt1.close();  	
				}
				if(rs != null) {
					rs.close();
				}
				if(con !=null) {
				con.close();
				}
				}
		
		
	
	}

	
}
