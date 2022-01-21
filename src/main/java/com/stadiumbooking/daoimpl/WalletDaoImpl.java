package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.WalletDao;
import com.stadiumbooking.model.Wallet_details;

public class WalletDaoImpl implements WalletDao {

	
	@Override
	public void insertAmount(Wallet_details wallete) throws ClassNotFoundException, SQLException {
		
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
	public ResultSet allUserWalletList() throws ClassNotFoundException, SQLException {
		/* Get All User Wallet Transaction details */
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select walletId,userId,amount,to_char(Transaction_Date,'dd-mm-yyyy HH:MI:SS') from wallet_details";
		
		ResultSet rs=stmt.executeQuery(query);

	
		return rs;
	}

	


}
