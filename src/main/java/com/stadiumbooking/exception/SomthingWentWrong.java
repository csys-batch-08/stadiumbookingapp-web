package com.stadiumbooking.exception;

public class SomthingWentWrong extends Exception {

	private static final long serialVersionUID = 1L;
	static final String MESSAGE="Already Exists User Details Entered";

	@Override
	public String getMessage() {
	
		return MESSAGE;
	}
	@Override
	public String toString() {
		return MESSAGE;
	}

}