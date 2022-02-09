package com.stadiumbooking.exception;


public class LowBalance extends Exception {

	private static final long serialVersionUID = 1L;
	static final String MESSAGE="Insufficient Balance";

@Override
public String getMessage() {
	
	return MESSAGE;
}
@Override
public String toString() {
	return MESSAGE;
}

	
}
