package com.stadiumbooking.exception;

public class HouseFull extends Exception {

	private static final long serialVersionUID = 1L;
	static final  String MESSAGE="House Full";

	@Override
	public String getMessage() {
		return MESSAGE;
	}
	@Override
	public String toString() {
		return MESSAGE;
	}

}
