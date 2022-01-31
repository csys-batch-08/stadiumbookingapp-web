package com.stadiumbooking.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.stadiumbooking.config.EncryptPassword;


public class ConnectionUtill {

	public  Connection getDBConnect() throws ClassNotFoundException, SQLException
	{
		Class.forName("oracle.jdbc.OracleDriver");

		try {
			return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system",EncryptPassword.decrypt());
		} catch (Exception e) {
		
			e.getMessage();
		}
		return null;	
	}
	
	
}
