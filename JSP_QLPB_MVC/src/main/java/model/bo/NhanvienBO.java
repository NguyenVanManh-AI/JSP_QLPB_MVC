package model.bo;

import java.util.List;

import model.bean.Nhanvien;
import model.bean.Nhanvien_Phongban;
import model.dao.NhanvienDAO;

public class NhanvienBO {
	public List<Nhanvien> getAll() {
		NhanvienDAO NhanvienDAO = new NhanvienDAO();
		return NhanvienDAO.getAll();
	}
	
	public List<Nhanvien> getNhanvienIDPB(String IDPB) {
		NhanvienDAO NhanvienDAO = new NhanvienDAO();
		return NhanvienDAO.getNhanvienIDPB(IDPB);
	}
	
	public List<Nhanvien_Phongban> search(String search_infor) {
		NhanvienDAO NhanvienDAO = new NhanvienDAO();
		return NhanvienDAO.search(search_infor);
	}
	
	public void insert(Nhanvien nhanvien) {
		NhanvienDAO nhanvienDAO = new NhanvienDAO();
		nhanvienDAO.insert(nhanvien);
	}
	
	public boolean nhanvienDelete(String IDNV) {
		NhanvienDAO nhanvienDAO = new NhanvienDAO();
		return nhanvienDAO.nhanvienDelete(IDNV);
	}
	
}
