package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.model.Wallet_details;

public interface WalletDao {

	public void insertAmount(Wallet_details wallete) throws ClassNotFoundException, SQLException;
	public ResultSet allUserWalletList() throws ClassNotFoundException, SQLException;
	
	
}
