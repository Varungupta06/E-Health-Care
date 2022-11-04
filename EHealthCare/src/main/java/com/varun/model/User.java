package com.varun.model;

public class User {

	private int id;
	private String name;
	private String email;
	private String password;
	private String role;
	private String gender;
	private int age;
	
	//Getters and setters
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	//Constructors
	public User(int id, String name, String email, String password, String role, String gender, int age) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.gender = gender;
		this.age = age;
	}
	public User(String name, String email, String password, String role, String gender, int age) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.gender = gender;
		this.age = age;
	}
	public User() {
		super();
	}
	
	
}
