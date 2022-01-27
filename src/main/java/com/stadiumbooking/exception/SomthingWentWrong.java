package com.stadiumbooking.exception;

public class SomthingWentWrong extends Exception {

	static final String MESSAGE="Something Went Wrong";

	@Override
	public String getMessage() {
	
		return MESSAGE;
	}
	@Override
	public String toString() {
		return MESSAGE;
	}

}