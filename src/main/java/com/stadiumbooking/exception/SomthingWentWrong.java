package com.stadiumbooking.exception;

public class SomthingWentWrong extends Exception {

	String message="Something Went Wrong";

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