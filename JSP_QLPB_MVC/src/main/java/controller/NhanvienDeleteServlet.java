package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Nhanvien;
import model.bean.Phongban;
import model.bo.NhanvienBO;
import model.bo.PhongbanBO;

@WebServlet("/NhanvienDeleteServlet")
public class NhanvienDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NhanvienDeleteServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NhanvienBO NhanvienBO = new NhanvienBO();
		List<Nhanvien> Nhanviens = NhanvienBO.getAll();
		request.setAttribute("nhanviens", Nhanviens);
		
		if(request.getParameter("IDNV") != null) {
			String IDNV = request.getParameter("IDNV");
			NhanvienBO = new NhanvienBO();
			boolean status_delete ; 
			try {
				status_delete = NhanvienBO.nhanvienDelete(IDNV);
				Nhanviens = NhanvienBO.getAll();
				request.setAttribute("nhanviens", Nhanviens);
				request.getRequestDispatcher("NhanvienDelete.jsp").forward(request, response);
				return ; 
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		request.getRequestDispatcher("NhanvienDelete.jsp").forward(request, response); 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
