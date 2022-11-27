package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Nhanvien;
import model.bo.NhanvienBO;

@WebServlet("/NhanvienDeleteAllServlet")
public class NhanvienDeleteAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public NhanvienDeleteAllServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NhanvienBO NhanvienBO = new NhanvienBO();
		List<Nhanvien> Nhanviens = NhanvienBO.getAll();
		request.setAttribute("nhanviens", Nhanviens);		
		request.getRequestDispatcher("NhanvienDeleteAll.jsp").forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NhanvienBO NhanvienBO = new NhanvienBO();
		List<Nhanvien> Nhanviens = NhanvienBO.getAll();
		
		if(request.getParameterValues("checkedId") != null) {
			String[] IDNVs = request.getParameterValues("checkedId");
			for(int i=0;i<IDNVs.length;i++) {
				NhanvienBO = new NhanvienBO();
				boolean status_delete ; 
				try {
					status_delete = NhanvienBO.nhanvienDelete(IDNVs[i]);
				} 
				catch (Exception e) {
					e.printStackTrace();
				}
			}
			Nhanviens = NhanvienBO.getAll();
			request.setAttribute("nhanviens", Nhanviens);
			request.getRequestDispatcher("NhanvienDeleteAll.jsp").forward(request, response);
		}
		request.getRequestDispatcher("NhanvienDeleteAll.jsp").forward(request, response);
	}
}
