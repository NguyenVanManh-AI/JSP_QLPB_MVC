package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.bean.Nhanvien;
import model.bo.NhanvienBO;

@WebServlet("/NhanvienAddServlet")
public class NhanvienAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NhanvienAddServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		request.getRequestDispatcher("NhanvienAdd.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		
		String IDNV = request.getParameter("IDNV");
		String Hoten = request.getParameter("Hoten");
		String Diachi = request.getParameter("Diachi");
		String IDPB = request.getParameter("IDPB");
		

		// IDNV hoặc content không được để trống 
		if(IDNV == "" || IDNV == null) {
			request.setAttribute("mess_add_error", "IDNV cannot be left blank !!!");
			request.getRequestDispatcher("NhanvienAdd.jsp").forward(request, response);
			return ; 
		}
		
		if(Hoten == "" || Hoten == null) {
			request.setAttribute("mess_add_error", "Name cannot be left blank !!!");
			request.getRequestDispatcher("NhanvienAdd.jsp").forward(request, response);
			return ; 
		}
		
		if(Diachi == "" || Diachi == null) {
			request.setAttribute("mess_add_error", "Address cannot be left blank !!!");
			request.getRequestDispatcher("NhanvienAdd.jsp").forward(request, response);
			return ; 
		}
		
		if(IDPB == "" || IDPB == null) {
			request.setAttribute("mess_add_error", "IDPB cannot be left blank !!!");
			request.getRequestDispatcher("NhanvienAdd.jsp").forward(request, response);
			return ; 
		}
		
		Nhanvien nhanvien = new Nhanvien(IDNV,Hoten,Diachi,IDPB);
		NhanvienBO nhanvienBO = new NhanvienBO();
		nhanvienBO.insert(nhanvien);
		request.setAttribute("mess_add_success", "Add Employes Success !!!");
		request.getRequestDispatcher("NhanvienAdd.jsp").forward(request, response);
		return ; 
	}

}
