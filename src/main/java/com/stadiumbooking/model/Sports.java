package com.stadiumbooking.model;

import java.util.Objects;

public class Sports {

	
	private int sportsId;
	private String sportsName;
	private String eventName;
	public Sports() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Sports(int sportsId, String sportsName, String eventName) {
		super();
		this.sportsId = sportsId;
		this.sportsName = sportsName;
		this.eventName = eventName;
	}


	public int getSportsId() {
		return sportsId;
	}
	public void setSportsId(int sportsId) {
		this.sportsId = sportsId;
	}
	public String getSportsName() {
		return sportsName;
	}
	public void setSportsName(String sportsName) {
		this.sportsName = sportsName;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	@Override
	public String toString() {
		return "Sports [sportsId=" + sportsId + ", sportsName=" + sportsName + ", eventName=" + eventName + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(eventName, sportsName);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Sports other = (Sports) obj;
		return Objects.equals(eventName, other.eventName) && Objects.equals(sportsName, other.sportsName);
	}
	
	
}
