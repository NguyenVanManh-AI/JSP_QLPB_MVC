package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.Nhanvien;
import model.bean.Nhanvien_Phongban;

public class NhanvienDAO {
	private Connection conn = DB.getConnection();
	PreparedStatement preStmt;
	
    public List<Nhanvien> getAll() {
		String sql = "SELECT * FROM nhanvien";
		List<Nhanvien> list = new ArrayList<Nhanvien>();
		try {
			preStmt = conn.prepareStatement(sql);
			ResultSet result = preStmt.executeQuery();
			
			while (result.next()) { 
				Nhanvien nhanvien = new Nhanvien("","","",""); 
				nhanvien.setIDNV(result.getString("IDNV"));
				nhanvien.setHoten(result.getString("Hoten"));
				nhanvien.setDiachi(result.getString("Diachi"));
				nhanvien.setIDPB(result.getString("IDPB"));
				list.add(nhanvien);
			}
		} catch (SQLException ex) {
			System.out.println(ex.getStackTrace());
		}
		
		return list;
	} 
    
    public List<Nhanvien> getNhanvienIDPB(String IDPB) {
		String sql = "SELECT * FROM nhanvien WHERE IDPB = ?";
		List<Nhanvien> list = new ArrayList<Nhanvien>();
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, IDPB);
			ResultSet result = preStmt.executeQuery();
			
			while (result.next()) { 
				Nhanvien nhanvien = new Nhanvien("","","",""); 
				nhanvien.setIDNV(result.getString("IDNV"));
				nhanvien.setHoten(result.getString("Hoten"));
				nhanvien.setDiachi(result.getString("Diachi"));
				nhanvien.setIDPB(result.getString("IDPB"));
				list.add(nhanvien);
			}
		} catch (SQLException ex) {
			System.out.println(ex.getStackTrace());
		}
		
		return list;
	} 
    
    public List<Nhanvien_Phongban> search(String search_infor) {
		String sql = "SELECT nv.IDNV, nv.Hoten, nv.Diachi, nv.IDPB, pb.Tenpb, pb.Mota FROM nhanvien as nv LEFT JOIN phongban as pb ON nv.IDPB = pb.IDPB WHERE nv.IDNV like ? OR nv.Hoten like ? OR nv.IDPB like ? OR nv.Diachi like ? OR pb.Tenpb like ? OR pb.Mota like ? ";
        // Một chú ý quan trọng là câu lệnh query này không được xuống dòng 
		List<Nhanvien_Phongban> list = new ArrayList<Nhanvien_Phongban>();
		try {
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, "%"+search_infor+"%");
			preStmt.setString(2, "%"+search_infor+"%");
			preStmt.setString(3, "%"+search_infor+"%");
			preStmt.setString(4, "%"+search_infor+"%");
			preStmt.setString(5, "%"+search_infor+"%");
			preStmt.setString(6, "%"+search_infor+"%");
			
			ResultSet result = preStmt.executeQuery();
			
			while (result.next()) { 
				Nhanvien_Phongban nhanvien_Phongban = new Nhanvien_Phongban("","","","","",""); 
				nhanvien_Phongban.setIDNV(result.getString("IDNV")); // IDNV, Hoten ,.. là tên các cột hiện ra trong bảng database , nếu ta đặt tên khác ví dụ 
				nhanvien_Phongban.setHoten(result.getString("Hoten")); // Hoten as HotenNV thì là getString(HotenNV) 
				nhanvien_Phongban.setDiachi(result.getString("Diachi"));
				nhanvien_Phongban.setIDPB(result.getString("IDPB"));
				nhanvien_Phongban.setTenpb(result.getString("Tenpb"));
				nhanvien_Phongban.setMota(result.getString("Mota"));
				list.add(nhanvien_Phongban);
			}
		} catch (SQLException ex) {
			System.out.println(ex.getStackTrace());
		}
		
		return list;
	}
    // key : Prepared Statement Question Mark within WHERE LIKE ‘%?%’
    // query vừa có like vừa có % và ? thì nên làm ntn : "%"+search_infor+"%" và ? 
    // thay vì search_infor và '%?%'
    

    public void insert(Nhanvien nhanvien) {
		String sql = "INSERT INTO nhanvien(IDNV, Hoten,Diachi,IDPB) VALUE (?, ?, ?, ?)";
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, nhanvien.getIDNV());
			preStmt.setString(2, nhanvien.getHoten());
			preStmt.setString(3, nhanvien.getDiachi());
			preStmt.setString(4, nhanvien.getIDPB());
			preStmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
			System.out.println(ex.getStackTrace());
		}
	}
    
    public boolean nhanvienDelete(String IDNV) {
    	String sql = "DELETE FROM nhanvien WHERE IDNV = ?";
		try {
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, IDNV);
			int resultSet = preStmt.executeUpdate(); 
		} 
		catch (SQLException ex) {
			ex.getStackTrace();
			return false; 
		}
		return true; 
	}
    
    
    
    
    
    
    
}
