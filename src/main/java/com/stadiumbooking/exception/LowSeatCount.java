package com.stadiumbooking.exception;

public class LowSeatCount extends Exception {

	String message="You Have Selected More Than LowAvailable Seats";

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
