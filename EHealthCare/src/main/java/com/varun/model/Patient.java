package com.varun.model;

import java.sql.Timestamp;

public class Patient {

	private String name;
	private String address;
	private String email;
	private String mobile;
	private String gender;
	private String issue;
	private int pid;
	private String pDate;
	public Patient(int pid ,String name, String address, String mobile, String gender, String issue,
			String pDate, String email) {
		
		this.name = name;
		this.address = address;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.issue = issue;
		this.pid = pid;
		this.pDate = pDate;
	}
	public Patient(String name, String address, String email, String mobile, String gender, String issue,
			String pDate) {
		super();
		this.name = name;
		this.address = address;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.issue = issue;
		this.pDate = pDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIssue() {
		return issue;
	}
	public void setIssue(String issue) {
		this.issue = issue;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	
}
