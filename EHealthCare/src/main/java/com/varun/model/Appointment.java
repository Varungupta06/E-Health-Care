package com.varun.model;

public class Appointment {

	

	private String name;
	private String address;
	private String email;
	private String mobile;
	private String gender;
	private String issue;
	private int aid;
	private int pid;
	private int did;
	private String pDate;
	
	public Appointment(int aid ,String name, String address, String email, String mobile, String gender, String issue,
			String pDate,int pid,int did) {
		this.name = name;
		this.address = address;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.issue = issue;
		this.aid = aid;
		this.pDate = pDate;
		this.pid = pid;
		this.did = did;
	}
	
	public Appointment(String name, String address, String email, String mobile, String gender, String issue,
			String pDate,int pid,int did) {
		this.name = name;
		this.address = address;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.issue = issue;
		this.pDate = pDate;
		this.pid = pid;
		this.did = did;
	}
	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
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
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	
	
	
	
	
}
