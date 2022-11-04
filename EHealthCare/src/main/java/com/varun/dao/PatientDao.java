package com.varun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.varun.model.Doctor;
import com.varun.model.Patient;

public class PatientDao {

	Connection con;
	
	public PatientDao(Connection con) {
		this.con = con;
	}

	public  boolean savePatient(Patient patient) throws SQLException {
		
		boolean f = false;
		String query = "insert into patient(name ,mobile,address,gender,issue,date,email)values(?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, patient.getName());
		ps.setString(2, patient.getMobile());
		
		ps.setString(3, patient.getAddress());
		ps.setString(4, patient.getGender());
		ps.setString(5, patient.getIssue());
		ps.setString(6, patient.getpDate());
		ps.setString(7, patient.getEmail());
		ps.executeUpdate();
		f=true;
		
		return f;
		
	}

	public List<Patient> getAllPatient()throws ClassNotFoundException, SQLException{
		List<Patient> patients = new ArrayList<>();
		PreparedStatement ps = Dao.getConnection().prepareStatement("select * from patient");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			System.out.println(rs.getInt(1));
			patients.add(new Patient(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
		}
		System.out.println("database "+patients);
		
		return patients;
		
	}
	
	public List<Patient> getPatientById(int pid) throws ClassNotFoundException, SQLException {
		List<Patient> patients = new ArrayList<>();
		PreparedStatement ps = Dao.getConnection().prepareStatement("select * from patient where pid = ?");
		ps.setInt(1, pid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			patients.add(new Patient(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
		}
		
		return patients;
		
		
		
		
	}
}
