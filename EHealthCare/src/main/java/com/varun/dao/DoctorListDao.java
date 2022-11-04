package com.varun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.varun.model.Doctor;

public class DoctorListDao {
 Connection con;

public DoctorListDao(Connection con) {
	
	this.con = con;
}


public List<Doctor> getAllDoctor()throws ClassNotFoundException, SQLException{
	List<Doctor> doctors = new ArrayList<>();
	PreparedStatement ps = Dao.getConnection().prepareStatement("select * from doctor");
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
		doctors.add(new Doctor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getString(10) , rs.getString(11)));
	}
	System.out.println("database "+doctors);
	return doctors;
	
}

public  boolean saveDoctor(Doctor doctor) throws SQLException {
	
	boolean f = false;
	String query = "insert into doctor(name ,surname,mobile,email,exp,qual,spec,address,country,state)values(?,?,?,?,?,?,?,?,?,?)";
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
	ps.executeUpdate();
	f=true;
	
	return f;
	
}

public List<Doctor> getDoctorById(int did) throws ClassNotFoundException, SQLException {
	List<Doctor> doctors = new ArrayList<>();
	PreparedStatement ps = Dao.getConnection().prepareStatement("select * from doctor where did = ?");
	ps.setInt(1, did);
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
		doctors.add(new Doctor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getString(10) , rs.getString(11)));
	}
	
	return doctors;
	
	
	
	
}

}
