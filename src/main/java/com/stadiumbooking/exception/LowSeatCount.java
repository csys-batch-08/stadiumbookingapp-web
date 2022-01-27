package com.stadiumbooking.exception;

public class LowSeatCount extends Exception {

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
