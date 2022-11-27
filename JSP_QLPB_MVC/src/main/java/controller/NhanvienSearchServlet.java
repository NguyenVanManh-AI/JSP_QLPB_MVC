package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Nhanvien_Phongban;
import model.bo.NhanvienBO;

@WebServlet("/NhanvienSearchServlet")
public class NhanvienSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NhanvienSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		String search_infor = "";
		
		if(request.getParameter("search_infor") == null || request.getParameter("search_infor").equals("")) {
			search_infor = "";
		}
		else {
			search_infor = request.getParameter("search_infor") ;
		}
		
		NhanvienBO NhanvienBO = new NhanvienBO();
		List<Nhanvien_Phongban> Nhanvien_Phongbans = NhanvienBO.search(search_infor);
		request.setAttribute("nhanvien_Phongbans", Nhanvien_Phongbans);
		request.setAttribute("search_infor", search_infor);
		request.getRequestDispatcher("NhanvienSearch.jsp").forward(request, response);
	}

}
