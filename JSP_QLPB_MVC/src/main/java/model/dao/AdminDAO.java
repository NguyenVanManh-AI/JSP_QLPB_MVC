package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.Admin;

public class AdminDAO {
	private Connection conn = DB.getConnection();
	PreparedStatement preStmt = null;
	
	public Admin findByUsername(String username) {
		String sql = "SELECT * FROM admin WHERE username = ?";
		Admin Admin = null;
		
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, username);
			
			ResultSet resultSet = preStmt.executeQuery();
			
			if (resultSet.next()) {
				Admin = new Admin("","");
				Admin.setUsername(username);
				Admin.setPassword(resultSet.getString("password"));
			}
		} catch (SQLException ex) {
			ex.getStackTrace();
		}
		return Admin;
	}
	
}
