package com.stadiumbooking.exception;

public class SomthingWentWrong extends Exception {

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