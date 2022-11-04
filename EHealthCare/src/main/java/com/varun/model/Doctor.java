package com.varun.model;

import java.sql.Timestamp;

public class Doctor {

	private String name;
	private String surname;
	private String address;
	private String email;
	private String mobile;
	private String exp;
	private String qual;
	private String spec;
	private String country;
	private String state;
	private int did;
	private Timestamp pDate;
	public Doctor(int did,String name, String surname,  String mobile, String email, String exp, String qual,
			String spec,String address, String country, String state) {
		super();
		this.name = name;
		this.surname = surname;
		this.address = address;
		this.email = email;
		this.mobile = mobile;
		this.exp = exp;
		this.qual = qual;
		this.spec = spec;
		this.country = country;
		this.state = state;
		this.did = did;
		
	}
	public Doctor(String name, String surname,  String mobile, String email, String exp, String qual,
			String spec,String address, String country, String state) {
		super();
		this.name = name;
		this.surname = surname;
		this.address = address;
		this.email = email;
		this.mobile = mobile;
		this.exp = exp;
		this.qual = qual;
		this.spec = spec;
		this.country = country;
		this.state = state;
		this.pDate = pDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
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
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public String getQual() {
		return qual;
	}
	public void setQual(String qual) {
		this.qual = qual;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getCountry() {
		System.out.println(country);
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	
	
	
}
