package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Phongban;
import model.bo.PhongbanBO;

@WebServlet("/PhongbanFormUpdateServlet")
public class PhongbanFormUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PhongbanFormUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		
		String IDPB = request.getParameter("IDPB");
		PhongbanBO PhongbanBO = new PhongbanBO();
		Phongban Phongban = null;
		try {
			Phongban = PhongbanBO.phongbanDetails(IDPB);
			request.setAttribute("Phongban_detail", Phongban);
			request.getRequestDispatcher("PhongbanFormUpdate.jsp").forward(request, response);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		
		// String oldIDPB = request.getParameter("oldIDPB"); 
		// Nếu ta muốn chỉnh sửa cả IDPB thì thêm tham số này để WHERE
		
		String IDPB = request.getParameter("oldIDPB"); 
		// Mặc khác vì input của IDPB ta đã khóa (disable) lên không thể lấy tham số được 
		// Nhưng trường hidden dù ẩn thì ta vẫn lấy được
		String Tenpb = request.getParameter("Tenpb");
		String Mota = request.getParameter("Mota");
		
		Phongban Phongban = new Phongban(IDPB,Tenpb,Mota);
		PhongbanBO PhongbanBO = new PhongbanBO();
		// PhongbanBO.update(Phongban,oldIDPB); // không nhất thiết phải chỉ truyền vào một biến Phongban 
		// ta có thể truyền thêm oldIDPB với trường hợp ta chỉnh sửa cả IDPB cho Phongban 
		// => ta cũng phải chỉnh sửa cả IDPB cho bảng Nhanvien 
		
		PhongbanBO.update(Phongban);
		request.setAttribute("mess_edit_success", "Edit Phongban Success !!!");
		doGet(request,response);
		return ; 
	}

}
