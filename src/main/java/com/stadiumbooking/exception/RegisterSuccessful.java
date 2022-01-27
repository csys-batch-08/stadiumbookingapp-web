package com.stadiumbooking.exception;

public class RegisterSuccessful extends Exception {

static final String MESSAGE="Registered Successfully";

	@Override
	public String getMessage() {
		
		return MESSAGE;
	}
	@Override
	public String toString() {
		return MESSAGE;
	}

}
