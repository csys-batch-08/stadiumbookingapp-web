package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.WalletDao;
import com.stadiumbooking.model.User;
import com.stadiumbooking.model.WalletDetails;

public class WalletDaoImpl implements WalletDao {

	
	@Override
	public void insertAmount(WalletDetails wallete) throws ClassNotFoundException, SQLException {
		
		/*Insert User Wallet Details intgo database */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		UserDaoImpl userDao=new UserDaoImpl();
		String query="insert into wallet_details(userId,amount) values(?,?)";
		PreparedStatement stmt=con.prepareStatement(query);
		stmt.setInt(1, wallete.getUserId());
		stmt.setLong(2, wallete.getAmount());
		int i=stmt.executeUpdate();
		//System.out.println(i+" Row Inserted");
		
		/* Update User Wallet Details in users table */
		
		int userid=wallete.getUserId();
		//System.out.println(userid);
		double amount=wallete.getAmount();
		//System.out.println(amount);
		userDao.addAmount(userid, amount);
		
	}

	@Override
	public List<WalletDetails> allUserWalletList() throws ClassNotFoundException, SQLException {
		/* Get All User Wallet Transaction details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select walletId,userId,amount,Transaction_Date from wallet_details";
		
		ResultSet rs=stmt.executeQuery(query);

		  List<WalletDetails> WalletList=new ArrayList<WalletDetails>();
			
		  while(rs.next()) {
			
				WalletDetails WalletDetails=new WalletDetails(rs.getInt(1),rs.getInt(2),rs.getLong(3),rs.getTimestamp(4).toLocalDateTime());
				WalletList.add(WalletDetails);
			}
			return WalletList;
	}

	


}
