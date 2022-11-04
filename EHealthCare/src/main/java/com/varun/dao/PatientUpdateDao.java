package com.varun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.varun.model.Doctor;
import com.varun.model.Patient;

public class PatientUpdateDao {
Connection con;
	
	
public PatientUpdateDao(Connection con) {
	this.con = con;
}


public boolean updatePatient(Patient patient) {
		
		boolean f= false;
		try {
			
			String query = "update patient set name =? ,mobile=?,address=?,gender=? ,issue=?,date=?,email=? where pid =?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, patient.getName());
			ps.setString(2, patient.getMobile());
			ps.setString(3, patient.getAddress());
			ps.setString(4, patient.getGender());
			ps.setString(5, patient.getIssue());
			ps.setString(6, patient.getpDate());
			ps.setString(7, patient.getEmail());
			ps.setInt(8, patient.getPid());
		
			ps.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
}

