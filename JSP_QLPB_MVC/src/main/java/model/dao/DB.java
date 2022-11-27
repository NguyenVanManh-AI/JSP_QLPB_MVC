package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DB {
	public static Connection getConnection() {
		Connection conn=null;

		try {
		  Class c = Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(Exception e){
		  
		}
		try {
		  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dulieupbjsp","root","");
		}
		catch(SQLException e) {
		  System.out.println("Error2!!!!!" + e);
		}
		
		return conn;
	}
	
}
