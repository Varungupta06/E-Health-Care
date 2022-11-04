package com.varun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.varun.model.User;

public class UpdatAdminDao {
Connection con;

public UpdatAdminDao(Connection con) {
	this.con = con;
}

public boolean updateAdmin(User user) {
	
	boolean f= false;
	try {
		
		String query = "update register set name =? , email=?,password=?,role=?,gender=?,age=? where id =?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, user.getName());
		ps.setString(2, user.getEmail());
		ps.setString(3, user.getPassword());
		ps.setString(4, user.getRole());
		ps.setString(5, user.getGender());
		ps.setInt(6, user.getAge());
		ps.setInt(7, user.getId());
		ps.executeUpdate();
		f=true;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return f;
	
}
}
