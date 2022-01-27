package com.stadiumbooking.model;

import java.util.Objects;

public class Ratings {

	private int reviewID;
	private int userId;
	private String 	reviews;
	private double ratingValue ;
	private int stadiumId;
	public Ratings() {
		super();

	}
	
	
	
	public Ratings(int reviewID, int userId, String reviews, double ratings, int stadiumId) {
		super();
		this.reviewID = reviewID;
		this.userId = userId;
		this.reviews = reviews;
		this.ratingValue = ratings;
		this.stadiumId = stadiumId;
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

	public double getRatingValue() {
		return ratingValue;
	}

	public void setRatingValue(double ratingValue) {
		this.ratingValue = ratingValue;
	}



	public int getStadiumId() {
		return stadiumId;
	}



	public void setStadiumId(int stadiumId) {
		this.stadiumId = stadiumId;
	}



	@Override
	public int hashCode() {
		return Objects.hash(reviewID, reviews, stadiumId);
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
		return reviewID == other.reviewID && Objects.equals(reviews, other.reviews) && stadiumId == other.stadiumId;
	}
	@Override
	public String toString() {
		return "Ratings [reviewID=" + reviewID + ", userId=" + userId + ", reviews=" + reviews + ", ratings=" + ratingValue
				+ ", stadium_id=" + stadiumId + "]";
	}
	
	
	
}
