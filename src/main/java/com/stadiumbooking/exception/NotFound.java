package com.stadiumbooking.exception;

public class NotFound extends Exception {
	static final String ERRORMESSAGE="Invalid Username or Password";
	
	@Override
	public String getMessage() {
		
		return ERRORMESSAGE;
	}
	@Override
	public String toString() {
		return ERRORMESSAGE;
	}

}
