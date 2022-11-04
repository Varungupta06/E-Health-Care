package com.varun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.varun.model.Appointment;
import com.varun.model.Doctor;

public class AppointmentDao {

	
	Connection con;

	public AppointmentDao(Connection con) {
		this.con = con;
	}
	public  boolean bookAppointment(Appointment app) throws SQLException {
		
		boolean f = false;
		String query = "insert into appointment(name, address, email, mobile, gender, issue, pdate,pid,did)values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, app.getName());
		ps.setString(2, app.getAddress());
		ps.setString(3, app.getEmail());
		ps.setString(4, app.getMobile());
		ps.setString(5, app.getGender());
		ps.setString(6, app.getIssue());
		ps.setString(7, app.getpDate());
		
		ps.setInt(8, app.getPid());
		ps.setInt(9, app.getDid());
		System.out.println(app.getPid() + "hello");
		ps.executeUpdate();
		f=true;
		
		return f;
		
	}
	

	public List<Appointment> getAllapp()throws ClassNotFoundException, SQLException{
		System.out.println("11");
		List<Appointment> apps = new ArrayList<>();
		PreparedStatement ps = Dao.getConnection().prepareStatement("select * from appointment");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			apps.add(new Appointment(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9),rs.getInt(10)));
		}
		
		return apps;
		
	}
}
