package com.varun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Deletedoctor {
	Connection con ;

	public Deletedoctor(Connection con) {
		this.con = con;
		
	}
	
	public boolean delteDoctor(int did) throws SQLException {
		boolean f=false;
		String query = "delete from doctor where did =?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, did);
		ps.executeUpdate();
		return f=true;
		
	}
	
}
