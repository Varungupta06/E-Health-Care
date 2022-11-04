package com.varun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.varun.model.User;

public class UserDao {
private Connection con;

public UserDao(Connection con) {
	this.con = con;
}

//method to insert user to database

public boolean saveUser(User user) {
	boolean f = false;
	try {
		
		String query = "insert into register(name ,email , password ,role ,gender ,age) values(?,?,?,?,?,?)";
		PreparedStatement ps = this.con.prepareStatement(query);
		ps.setString(1, user.getName());
		ps.setString(2, user.getEmail());
		ps.setString(3, user.getPassword());
		ps.setString(4, user.getRole());
		ps.setString(5, user.getGender());
		ps.setInt(6, user.getAge());
		
		ps.executeUpdate();
		f=true;
	} catch (Exception e) {
		e.printStackTrace();
}
	return f;

}


public User getUserByEmail(String email , String password , String role) {

	User user = null;
	
	try {
		
		String query = "Select * from register where email = ? and password = ? and role = ?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, email);
		ps.setString(2, password);
		ps.setString(3, role);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			user = new User();
			String name = rs.getString("name");
			user.setName(name);
			
			user.setId(rs.getInt("id"));
			user.setEmail(rs.getString("email"));
			user.setGender(rs.getString("gender"));
			user.setRole(rs.getString("role"));
			user.setAge(rs.getInt("age"));
			
		}
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	
	return user;
	
}



}
