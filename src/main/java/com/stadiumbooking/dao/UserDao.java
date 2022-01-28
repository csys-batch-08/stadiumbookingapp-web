package com.stadiumbooking.dao;


import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.User;



public interface UserDao {

	public int insertUser(User user) throws  SQLException;
    public List<User> getAllUser() throws  SQLException;
	public List<User> getUserById(int id) throws SQLException;
	public void updateUser(User user) throws SQLException;
	public void deleteUser(int userId) throws SQLException;
	public List<User> validateUser(String username, String password) throws SQLException;
	public boolean checkUser(String username, String password) throws SQLException;
	public void addAmount(int userId,double amount ) throws SQLException;
	public void refundPice(int userId,double amount ) throws SQLException;
	public void bookingTicktes(int userid, double amount) throws SQLException;
	public Double userWalletDetails(int userid) throws SQLException;
	public void updateUserProfilePic(int useid,String pic) throws SQLException;
	public String getUserNamebyId(int userid) throws  SQLException;
	public boolean checkUser(String userName,String email,Long phone) throws ClassNotFoundException, SQLException;
}
