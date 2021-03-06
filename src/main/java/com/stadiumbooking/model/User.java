package com.stadiumbooking.model;

public class User {
	

	private int userid;
	private String name;
	private String username;
	private String role;
	private String password;
	private String email;
	private long phoneNumber;
	private Double wallet;
	private String profilePic;
	
	
	
	public Double getWallet() {
		return wallet;
	}

	public void setWallet(Double wallet) {
		this.wallet = wallet;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public User() {
		super();
	
	}


	public User(int userid, String name, String username, String role, String password, String email, long phoneNumber,
			Double wallet, String profilePic) {
		super();
		this.userid = userid;
		this.name = name;
		this.username = username;
		this.role = role;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.wallet = wallet;
		this.profilePic = profilePic;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "User \nuserid=" + userid + ",\n name=" + name + ",\n username=" + username + ", \nrole=" + role + ", \npassword="
				+ password + ",\n email=" + email + ", \nphoneNumber=" + phoneNumber;
	}

	

}
