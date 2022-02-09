package com.stadiumbooking.exception;

public class NotFound extends Exception {
	private static final long serialVersionUID = 1L;
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
