package com.stadiumbooking.exception;

public class RegisterSuccessful extends Exception {

	private static final long serialVersionUID = 1L;
	static final String MESSAGE = "Registered Successfully";

	@Override
	public String getMessage() {

		return MESSAGE;
	}

	@Override
	public String toString() {
		return MESSAGE;
	}

}
