package com.stadiumbooking.exception;

public class NotFound extends Exception {
	String errorMessage="Invalid Username or Password";
	
	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return errorMessage;
	}
	@Override
	public String toString() {
		return errorMessage;
	}

}
