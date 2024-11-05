package com.entity;

public class User {
	private int id;
	private String fullName;
	private String email;
	private String pass;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(int id, String fullName, String email) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
    }
	
	public User(String fullName, String email, String pass) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.pass = pass;
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

	public String getPassword() {
		return pass;
	}

	public void setPassword(String password) {
		this.pass = pass;
	}

}