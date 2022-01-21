package com.stadiumbooking.model;

public class User {
	

	private int userid;
	private String name;
	private String username;
	private String role;
	private String password;
	private String email;
	private long phoneNumber;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userid) {
		super();
		this.userid = userid;
	}

	public User( String name, String username,  String password, String email,
			long phoneNumber) {
		super();
		this.name = name;
		this.username = username;
		this.role = role;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
	}



	public User(int userId2, String name2, String username2, String password2, String email2, Long phoneNumber2) {
		this.userid=userId2;
		this.name=name2;
		this.username=username2;
		this.password=password2;
		this.email=email2;
		this.phoneNumber=phoneNumber2;
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
