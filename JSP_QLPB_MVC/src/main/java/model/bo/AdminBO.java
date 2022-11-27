package model.bo;

import java.sql.SQLException;
import java.util.List;

import model.bean.Admin;
import model.dao.AdminDAO;

public class AdminBO {	
	
	public Admin findByUsername(String username) throws SQLException {
		AdminDAO AdminDAO = new AdminDAO();
		return AdminDAO.findByUsername(username);
	}
	
}
