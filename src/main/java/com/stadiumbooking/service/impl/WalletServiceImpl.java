package com.stadiumbooking.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.model.WalletDetails;
import com.stadiumbooking.service.WalletService;

public class WalletServiceImpl implements WalletService {

	static final WalletDaoImpl walletDao=new WalletDaoImpl();
	@Override
	public void insertAmount(WalletDetails wallete) throws SQLException {
		walletDao.insertAmount(wallete);
		
	}

	@Override
	public List<WalletDetails> allUserWalletList() throws SQLException {
		
		return walletDao.allUserWalletList();
	}

	@Override
	public List<WalletDetails> getUserWalletListById(int userId) throws SQLException {
		
		return walletDao.getUserWalletListById(userId);
	}

}
