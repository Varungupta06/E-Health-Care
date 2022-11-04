package com.varun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Deletpatient {
	
	Connection con;
	

	public Deletpatient(Connection con) {
		
		this.con = con;
	}


	public boolean deletePatient(int did) throws SQLException {
		boolean f=false;
		String query = "delete from patient where pid =?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, did);
		ps.executeUpdate();
		return f=true;
		
	}
}
