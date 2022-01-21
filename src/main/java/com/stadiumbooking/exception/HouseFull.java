package com.stadiumbooking.exception;

public class HouseFull extends Exception {

	String message="House Full";

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
