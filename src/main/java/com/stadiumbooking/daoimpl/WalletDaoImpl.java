package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.WalletDao;
import com.stadiumbooking.logger.Logger;
import com.stadiumbooking.model.User;
import com.stadiumbooking.model.WalletDetails;
import com.stadiumbooking.service.impl.UserServiceImpl;

public class WalletDaoImpl implements WalletDao {

	static final UserServiceImpl userService=new UserServiceImpl();
	static final String WALLETID="WALLETID";
	static final String USERID="USERID";
	static final String AMOUNT="AMOUNT";
	static final String TRANSACTION_DATE="TRANSACTION_DATE";
	
	@Override
	public void insertAmount(WalletDetails wallete) throws SQLException {

		/* Insert User Wallet Details intgo database */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = conUtil.getDBConnect();
			String query = "insert into wallet_details(userId,amount) values(?,?)";
			stmt = con.prepareStatement(query);
			stmt.setInt(1, wallete.getUser().getUserid());
			stmt.setLong(2, wallete.getAmount());
			stmt.executeUpdate();

			/* Update User Wallet Details in users table */

			int userid = wallete.getUser().getUserid();
			double amount = wallete.getAmount();
			userService.addAmount(userid, amount);
		} catch (ClassNotFoundException | SQLException e) {

			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
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
	public List<WalletDetails> allUserWalletList() throws  SQLException {
		/* Get All User Wallet Transaction details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;

		List<WalletDetails> walletList=null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select WALLETID,USERID,AMOUNT,TRANSACTION_DATE from wallet_details";
			 stmt = con.prepareStatement(query);
             rs = stmt.executeQuery(query);

			 walletList = new ArrayList<>();

			while (rs.next()) {
				User user=new User();
				user=userService.getUserById(rs.getInt(USERID));
				WalletDetails walletDetails = new WalletDetails(rs.getInt(WALLETID),user, rs.getLong(AMOUNT),
						rs.getTimestamp(TRANSACTION_DATE).toLocalDateTime());
				walletList.add(walletDetails);
			}
			return walletList;
		
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
		return walletList;
		
}

	@Override
	public List<WalletDetails> getUserWalletListById(int userId) throws SQLException {
		/* Get a Single User Wallet Transaction details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;

		List<WalletDetails> walletList=null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select WALLETID,USERID,AMOUNT,TRANSACTION_DATE from wallet_details where USERID=?";
			 stmt = con.prepareStatement(query);
             stmt.setInt(1, userId);
			 rs = stmt.executeQuery();

			 walletList = new ArrayList<>();

			while (rs.next()) {

				
				User user=new User();
				user=userService.getUserById(rs.getInt(USERID));
				WalletDetails walletDetails = new WalletDetails(rs.getInt(WALLETID),user, rs.getLong(AMOUNT),
						rs.getTimestamp(TRANSACTION_DATE).toLocalDateTime());
				walletList.add(walletDetails);
			}
			return walletList;
		
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
		return walletList;
	}
}
