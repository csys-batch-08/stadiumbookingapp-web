package com.stadiumbooking.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.model.User;
import com.stadiumbooking.service.UserService;

public class UserServiceImpl implements UserService {

	static final UserDaoImpl userDao=new UserDaoImpl();
	@Override
	public int insertUser(User user) throws SQLException {
		
		return userDao.insertUser(user);
	}

	@Override
	public List<User> getAllUser() throws SQLException {
		
		return userDao.getAllUser();
	}

	@Override
	public User getUserById(int id) throws SQLException {
		
		return userDao.getUserById(id);
	}

	@Override
	public void updateUser(User user) throws SQLException {
		userDao.updateUser(user);
		
	}

	@Override
	public int deleteUser(int userId) throws SQLException {
		
		return userDao.deleteUser(userId);
	}

	@Override
	public List<User> validateUser(String username, String password) throws SQLException {
		
		return userDao.validateUser(username, password);
	}

	@Override
	public boolean checkUser(String username, String password) throws SQLException {
		
		return userDao.checkUser(username, password);
	}

	@Override
	public void addAmount(int userId, double amount) throws SQLException {
		userDao.addAmount(userId, amount);
		
	}

	@Override
	public void refundPice(int userId, double amount) throws SQLException {
		userDao.refundPice(userId, amount);
		
	}

	@Override
	public void bookingTicktes(int userid, double amount) throws SQLException {
		userDao.bookingTicktes(userid, amount);
		
	}

	@Override
	public Double userWalletDetails(int userid) throws SQLException {

		return userDao.userWalletDetails(userid);
	}

	@Override
	public void updateUserProfilePic(int useid, String pic) throws SQLException {
		userDao.updateUserProfilePic(useid, pic);
		
	}

	@Override
	public String getUserNamebyId(int userid) throws SQLException {
		return userDao.getUserNamebyId(userid);
	}

	@Override
	public boolean checkUser(String userName, String email, Long phone) throws ClassNotFoundException, SQLException {
		
		return userDao.checkUser(userName, email, phone);
	}

	@Override
	public User checkUser(String userName) throws SQLException {
		
		return userDao.checkUser(userName);
	}

	@Override
	public User checkUserEmail(String email) throws SQLException {
		
		return userDao.checkUserEmail(email);
	}

	@Override
	public User checkPhoneNumber(Long phoneNumber) throws SQLException {
		
		return userDao.checkPhoneNumber(phoneNumber);
	}

}
