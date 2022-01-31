package com.stadiumbooking.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.stadiumbooking.encryption.Encryptpassword;


public class ConnectionUtill {

	public  Connection getDBConnect() throws ClassNotFoundException
	{ 
		try {
			Encryptpassword ep=new Encryptpassword();
			String encrptPassword=ep.encrypt("oracle");
			String decrpyPass=ep.decrypt(encrptPassword);
			Class.forName("oracle.jdbc.OracleDriver");

			return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system",decrpyPass);	

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
			}
	
	
}
