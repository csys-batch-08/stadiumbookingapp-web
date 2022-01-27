package com.stadiumbooking.exception;


public class LowBalance extends Exception {
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
