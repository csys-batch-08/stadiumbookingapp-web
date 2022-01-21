package com.stadiumbooking.exception;


public class LowBalance extends Exception {
String message="Insufficient Balance";

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
