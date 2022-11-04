package com.varun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.varun.model.Doctor;


public class UpdateDoctorDao {

	Connection con;

	public UpdateDoctorDao(Connection con) {
		this.con = con;
	}
	
	public boolean updateDoctor(Doctor doctor) {
		
		boolean f= false;
		try {
			
			String query = "update doctor set name =? ,surname=?,mobile=?,email=?,exp=?,qual=?,spec=?,address=?,country=? ,state=? where did =?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, doctor.getName());
			ps.setString(2, doctor.getSurname());
			ps.setString(3, doctor.getMobile());
			ps.setString(4, doctor.getEmail());
			ps.setString(5, doctor.getExp());
			ps.setString(6, doctor.getQual());
			ps.setString(7, doctor.getSpec());
			ps.setString(8, doctor.getAddress());
			ps.setString(9, doctor.getCountry());
			ps.setString(10, doctor.getState());
			ps.setInt(11,doctor.getDid());
			ps.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
}
