<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.bean.Nhanvien"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Xem nhân viên</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        #main{
            display: flex;
            padding:20px;
        }
        #sidebar{
            width: 22%;
            height: 100%;
        }
        #content {
            width: 78%;
            height: 530px;
            border: 2px solid #007bff;
            padding: 10px 20px;
            margin-left:30px ;
            overflow-y: scroll;
        }
    </style>
</head>
<body>

    <div id="main">
        <div id="sidebar">
            <%@ include file="Sidebar.jsp" %>
        </div>
        <div id="content">

        <% 
            //String disp2 = "block"; // ở đây phải đặt là disp2 vì ta đã include file Sidebar.jsp 
            // mà trong file đó có biến disp rồi nên ra không đặt lại biến một lần nữa 
            // điều này có nghĩa là khi mà ta include file thì ta cũng hoàn toàn sử dụng lại code 
            // và các biến trong file đó được 
            //if (session.getAttribute("username") == null || session.getAttribute("username").equals("")){
    	    //    disp2 = "none";
            //}
            // Mà đã sử dụng được thì ta dùng biến style='display:<%= disp % >' luôn 
            // thay vì style='display:<%= disp2 % >'
        %>
            <div style='display:<%= disp %>'> 
                <button style='float : left;' class='btn btn-success' ><a href="NhanvienAdd.jsp" style='color:white'><i class='fa-solid fa-plus'></i> Chèn Nhân Viên</a></button><br><hr>
            </div> 
            <h4 style="width:100%;text-align:center;color:#007bff">Dữ Liệu Bảng Nhân Viên</h4>
            <table width='100%' class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Mã Nhân viên</th>
                        <th scope="col">Tên Nhân viên</th>
                        <th scope="col">Mã Phòng Phòng Ban</th>
                        <th scope="col">Địa chỉ</th>
                    </tr>
                </thead>
                <tbody>
<%
	List<Nhanvien> nhanviens = (ArrayList<Nhanvien>) request.getAttribute("nhanviens");
	if(nhanviens == null){
		response.sendRedirect("NhanvienListServlet");
	}
	else {
		for (int i = 0; i < nhanviens.size(); i++) {
%>
                <tr>
                <td scope='row'><%= nhanviens.get(i).getIDNV() %></td>
                <td><%= nhanviens.get(i).getHoten() %></td>
                <td><%= nhanviens.get(i).getDiachi() %></td>
                <td><%= nhanviens.get(i).getIDPB() %></td>	
<%
		}
	}; 
%>

                </tbody>
            </table>
        </div>
    </div>

</body>
</html>