package model.bo;

import java.util.List;

import model.bean.Phongban;
import model.dao.PhongbanDAO;

public class PhongbanBO {
	public List<Phongban> getAll() {
		PhongbanDAO PhongbanDAO = new PhongbanDAO();
		return PhongbanDAO.getAll();
	}
	
	public Phongban phongbanDetails(String IDPB) {
		PhongbanDAO PhongbanDAO = new PhongbanDAO();
		return PhongbanDAO.phongbanDetails(IDPB);
	}
	
	public void update(Phongban Phongban) {
		PhongbanDAO phongbanDAO = new PhongbanDAO();
		phongbanDAO.update(Phongban);
	}
	
	
}
