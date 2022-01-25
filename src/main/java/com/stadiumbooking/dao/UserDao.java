package com.stadiumbooking.dao;


import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.model.User;



public interface UserDao {

	public int insertUser(User user) throws ClassNotFoundException, SQLException;
    public List<User> getAllUser() throws ClassNotFoundException, SQLException;
	public List<User> getUserById(int id) throws ClassNotFoundException, SQLException;
	public void updateUser(User user) throws ClassNotFoundException, SQLException;
	public void deleteUser(int userId) throws ClassNotFoundException, SQLException;
	public List<User> validateUser(String username, String password) throws ClassNotFoundException, SQLException;
	public boolean checkUser(String username, String password) throws ClassNotFoundException, SQLException;
	public void addAmount(int userId,double amount ) throws ClassNotFoundException, SQLException;
	public void refundPice(int userId,double amount ) throws ClassNotFoundException, SQLException;
	public void bookingTicktes(int userid, double amount) throws ClassNotFoundException, SQLException;
	public Double userWalletDetails(int userid) throws ClassNotFoundException, SQLException;
	public void updateUserProfilePic(int useid,String pic) throws ClassNotFoundException, SQLException;
	public String getUserNamebyId(int userid) throws ClassNotFoundException, SQLException;
	public boolean checkUser(String userName,String email,Long phone) throws ClassNotFoundException, SQLException;
}
