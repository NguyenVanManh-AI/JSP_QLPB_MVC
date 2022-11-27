package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Phongban;
import model.bo.PhongbanBO;

@WebServlet("/PhongbanListServlet")
public class PhongbanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PhongbanListServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PhongbanBO PhongbanBO = new PhongbanBO();
		List<Phongban> Phongbans = PhongbanBO.getAll();
		request.setAttribute("phongbans", Phongbans);
		request.getRequestDispatcher("PhongbanList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
