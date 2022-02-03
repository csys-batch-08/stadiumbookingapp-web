package com.stadiumbooking.model;

import java.util.List;
import java.util.Objects;

public class StadiumDetalis {

	private int stadiumId;
	private String stadiumName;
	private String stadiumImg;
	private List<Ratings> ratings;
	
	public List<Ratings> getRatings() {
		return ratings;
	}
	public void setRatings(List<Ratings> ratings) {
		this.ratings = ratings;
	}
	public int getStadiumId() {
		return stadiumId;
	}
	public void setStadiumId(int stadiumId) {
		this.stadiumId = stadiumId;
	}
	public String getStadiumName() {
		return stadiumName;
	}
	public void setStadiumName(String stadiumName) {
		this.stadiumName = stadiumName;
	}
	public String getStadiumImg() {
		return stadiumImg;
	}
	public void setStadiumImg(String stadiumImg) {
		this.stadiumImg = stadiumImg;
	}
	public StadiumDetalis() {
		super();
		
	}
	public StadiumDetalis(int stadiumId, String stadiumName, String stadiumImg) {
		super();
		this.stadiumId = stadiumId;
		this.stadiumName = stadiumName;
		this.stadiumImg = stadiumImg;
	}
	
	public StadiumDetalis(int stadiumId, String stadiumName, String stadiumImg, List<Ratings> ratings) {
		super();
		this.stadiumId = stadiumId;
		this.stadiumName = stadiumName;
		this.stadiumImg = stadiumImg;
		this.ratings = ratings;
	}
	@Override
	public String toString() {
		return "StadiumDetalis [stadiumId=" + stadiumId + ", stadiumName=" + stadiumName + ", stadiumImg=" + stadiumImg
				+ "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(stadiumName);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StadiumDetalis other = (StadiumDetalis) obj;
		return Objects.equals(stadiumName, other.stadiumName);
	}
	
	
	

	
}
