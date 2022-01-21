package com.stadiumbooking.model;

import java.util.Objects;

public class Ratings {

	private int reviewID;
	private int userId ;
	private String 	reviews;
	private double ratings  ;
	private int stadium_id;
	public Ratings() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ratings( int userId, String reviews, double ratings, int stadium_id) {
		super();
		
		this.userId = userId;
		this.reviews = reviews;
		this.ratings = ratings;
		this.stadium_id = stadium_id;
	}
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getReviews() {
		return reviews;
	}
	public void setReviews(String reviews) {
		this.reviews = reviews;
	}
	public double getRatings() {
		return ratings;
	}
	public void setRatings(double ratings) {
		this.ratings = ratings;
	}
	public int getStadium_id() {
		return stadium_id;
	}
	public void setStadium_id(int stadium_id) {
		this.stadium_id = stadium_id;
	}
	@Override
	public int hashCode() {
		return Objects.hash(reviewID, reviews, stadium_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Ratings other = (Ratings) obj;
		return reviewID == other.reviewID && Objects.equals(reviews, other.reviews) && stadium_id == other.stadium_id;
	}
	@Override
	public String toString() {
		return "Ratings [reviewID=" + reviewID + ", userId=" + userId + ", reviews=" + reviews + ", ratings=" + ratings
				+ ", stadium_id=" + stadium_id + "]";
	}
	
	
	
}
