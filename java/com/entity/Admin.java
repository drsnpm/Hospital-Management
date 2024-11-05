package com.entity;

public class Admin {
	private int id;
	private String fullName;
	private String email;
	private String mobNo;
	private String userName;
	private String dob;
	private String gender;
	private String password;
	
	
	public Admin() {
		super();
	}
	
	public Admin(int id, String fullName, String email, String mobNo, String userName, String dob, String gender,
			String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.mobNo = mobNo;
		this.userName = userName;
		this.dob = dob;
		this.gender = gender;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobNo() {
		return mobNo;
	}

	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
