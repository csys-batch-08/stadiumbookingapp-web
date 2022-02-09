package com.stadiumbooking.exception;

public class LowSeatCount extends Exception {

	private static final long serialVersionUID = 1L;
	static final String MESSAGE="You Have Selected More Than LowAvailable Seats";

	@Override
	public String getMessage() {
		
		return MESSAGE;
	}
	@Override
	public String toString() {
		return MESSAGE;
	}

}
