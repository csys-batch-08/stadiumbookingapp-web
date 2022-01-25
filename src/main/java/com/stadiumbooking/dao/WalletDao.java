package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.WalletDetails;

public interface WalletDao {

	public void insertAmount(WalletDetails wallete) throws ClassNotFoundException, SQLException;
	public List<WalletDetails> allUserWalletList() throws ClassNotFoundException, SQLException;
	
	
}
