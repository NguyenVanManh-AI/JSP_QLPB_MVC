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

@WebServlet("/NhanvienListServlet")
public class NhanvienListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NhanvienListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NhanvienBO NhanvienBO = new NhanvienBO();
		List<Nhanvien> Nhanviens = NhanvienBO.getAll();
		request.setAttribute("nhanviens", Nhanviens);
		
		if(request.getParameter("IDPB") != null) {
			String IDPB = request.getParameter("IDPB");
			Nhanviens = NhanvienBO.getNhanvienIDPB(IDPB);
			request.setAttribute("nhanviens", Nhanviens);
			
		}
		request.getRequestDispatcher("NhanvienList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
