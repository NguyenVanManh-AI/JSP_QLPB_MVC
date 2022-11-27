package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Admin;
import model.bo.AdminBO;

@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// username và password không được để trống 
		if(username == "" || username == null || password == "" || password == null) {
			request.setAttribute("mess_login_error", "Username or Password cannot be left blank");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return ;  
		}
		
		AdminBO AdminBO = new AdminBO();
		Admin Admin = null;
		try {
			Admin = AdminBO.findByUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// user không đúng => tài khoản không tồn tại 
		if (Admin == null) {
			request.setAttribute("mess_login_error", "Account does not exist !!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return ;
		}
		
		// tài khoản tồn tại nhưng password không đúng 
		if (Admin.getPassword().equals(password) == false) {
			request.setAttribute("mess_login_error", "Incorrect password !!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return ;
		}
		
		boolean isLogged = true;
		if (Admin == null || Admin.getPassword().equals(password) == false) {
			isLogged = false;
		}
		
		if (isLogged) {
			HttpSession session = request.getSession();
			session.setAttribute("username", Admin.getUsername());
			response.sendRedirect("NhanvienList.jsp");
			return;
		} 
		else {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}
	}

}
