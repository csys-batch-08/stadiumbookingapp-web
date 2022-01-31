package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.WalletDao;
import com.stadiumbooking.model.WalletDetails;

public class WalletDaoImpl implements WalletDao {

	@Override
	public void insertAmount(WalletDetails wallete) throws SQLException {

		/* Insert User Wallet Details intgo database */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = conUtil.getDBConnect();
			UserDaoImpl userDao = new UserDaoImpl();
			String query = "insert into wallet_details(userId,amount) values(?,?)";
			stmt = con.prepareStatement(query);
			stmt.setInt(1, wallete.getUserId());
			stmt.setLong(2, wallete.getAmount());
			stmt.executeUpdate();

			/* Update User Wallet Details in users table */

			int userid = wallete.getUserId();
			double amount = wallete.getAmount();
			userDao.addAmount(userid, amount);
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
	public List<WalletDetails> allUserWalletList() throws  SQLException {
		/* Get All User Wallet Transaction details */

		ConnectionUtill conUtil = new ConnectionUtill();
		Connection con = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;

		List<WalletDetails> walletList=null;
		try {
			con = conUtil.getDBConnect();
			String query = "Select walletId,userId,amount,Transaction_Date from wallet_details";
			 stmt = con.prepareStatement(query);
             rs = stmt.executeQuery(query);

			 walletList = new ArrayList<>();

			while (rs.next()) {

				WalletDetails walletDetails = new WalletDetails(rs.getInt(1), rs.getInt(2), rs.getLong(3),
						rs.getTimestamp(4).toLocalDateTime());
				walletList.add(walletDetails);
			}
			return walletList;
		
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
		return walletList;
		
}
}
