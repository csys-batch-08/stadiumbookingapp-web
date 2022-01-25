package com.stadiumbooking.model;

import java.util.Objects;

public class StadiumDetalis {

	private int stadium_id;
	private String stadium_name;
	private String stadium_img;
	public StadiumDetalis() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public int getStadium_id() {
		return stadium_id;
	}public StadiumDetalis(int stadium_id, String stadium_name, String stadium_img) {
		super();
		this.stadium_id = stadium_id;
		this.stadium_name = stadium_name;
		this.stadium_img = stadium_img;
	}


	public void setStadium_id(int stadium_id) {
		this.stadium_id = stadium_id;
	}
	public String getStadium_name() {
		return stadium_name;
	}
	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}
	public String getStadium_img() {
		return stadium_img;
	}
	public void setStadium_img(String stadium_img) {
		this.stadium_img = stadium_img;
	}
	@Override
	public String toString() {
		return "Stadium_detalis [stadium_id=" + stadium_id + ", stadium_name=" + stadium_name + ", stadium_img="
				+ stadium_img + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(stadium_id, stadium_img, stadium_name);
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
		return stadium_id == other.stadium_id && Objects.equals(stadium_img, other.stadium_img)
				&& Objects.equals(stadium_name, other.stadium_name);
	}
	
	
	
}
