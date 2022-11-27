package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.Phongban;

public class PhongbanDAO {
	private Connection conn = DB.getConnection();
	PreparedStatement preStmt;
	
    public List<Phongban> getAll() {
		String sql = "SELECT * FROM phongban";
		List<Phongban> list = new ArrayList<Phongban>();
		try {
			preStmt = conn.prepareStatement(sql);
			ResultSet result = preStmt.executeQuery();
			
			while (result.next()) { 
				Phongban phongban = new Phongban("","",""); 
				phongban.setIDPB(result.getString("IDPB"));
				phongban.setTenpb(result.getString("Tenpb"));
				phongban.setMota(result.getString("Mota"));
				list.add(phongban);
			}
		} catch (SQLException ex) {
			System.out.println(ex.getStackTrace());
		}
		
		return list;
	} 
    
    public Phongban phongbanDetails(String IDPB) {
    	String sql = "SELECT * FROM phongban WHERE IDPB = ?";
    	Phongban Phongban = null;
		
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, IDPB);
			ResultSet resultSet = preStmt.executeQuery();
			if (resultSet.next()) {
				Phongban = new Phongban("","","");
				Phongban.setIDPB(resultSet.getString("IDPB"));
				Phongban.setMota(resultSet.getString("Mota"));
				Phongban.setTenpb(resultSet.getString("Tenpb"));
			}
		} 
		catch (SQLException ex) {
			ex.getStackTrace();
		}
		return Phongban;
	}
    
	public void update(Phongban Phongban) { 
		String sql = "UPDATE phongban SET Tenpb = ? , Mota = ? WHERE IDPB = ? ";
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, Phongban.getTenpb());
			preStmt.setString(2, Phongban.getMota());
			preStmt.setString(3, Phongban.getIDPB());
			preStmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
			System.out.println(ex.getStackTrace());
		}
	}
    
    
}

