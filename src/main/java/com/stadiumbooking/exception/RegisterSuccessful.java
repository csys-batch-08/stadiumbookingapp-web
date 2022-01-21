package com.stadiumbooking.exception;

public class RegisterSuccessful extends Exception {

	String message="Registered Successfully";

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return message;
	}
	@Override
	public String toString() {
		return message;
	}

}
