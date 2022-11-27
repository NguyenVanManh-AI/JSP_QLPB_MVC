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
	<title>Xóa Nhiều Dữ Liệu Bảng Nhân Viên</title>
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
<% 
    if (session.getAttribute("username") == null || session.getAttribute("username").equals("")){
    	response.sendRedirect("Login.jsp");
    }
    else {  
    	
%>
    <div id="main">
        <div id="sidebar">
            <%@ include file="Sidebar.jsp" %>
        </div>
        <div id="content">

            <h4 style="width:100%;text-align:center;color:#007bff">Xóa Nhiều Dữ Liệu Bảng Nhân Viên</h4>
            <form action='NhanvienDeleteAllServlet' method='POST'>
                <table width='100%' class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Mã Nhân viên</th>
                            <th scope="col">Tên Nhân viên</th>
                            <th scope="col">Mã Phòng Phòng Ban</th>
                            <th scope="col">Địa chỉ</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                    
<%
	List<Nhanvien> nhanviens = (ArrayList<Nhanvien>) request.getAttribute("nhanviens");
	if(nhanviens == null){
		response.sendRedirect("NhanvienDeleteAllServlet");
	}
	else {
		for (int i = 0; i < nhanviens.size(); i++) {
%>
                <tr>
                <td scope='row'><%= nhanviens.get(i).getIDNV() %></td>
                <td><%= nhanviens.get(i).getHoten() %></td>
                <td><%= nhanviens.get(i).getDiachi() %></td>
                <td><%= nhanviens.get(i).getIDPB() %></td>
                <td><input type='checkbox' name='checkedId' value='<%= nhanviens.get(i).getIDNV() %>'></td>
<%
		}
	}; 
%>

                    </tbody>
                </table>
                <hr>
                <button type='submit' class='btn btn-danger' onClick="return confirm('Are you sure you want to delete all these employees?')"><i class='fa-solid fa-trash'></i> Xóa Các Nhân Viên</button>
            <br><br>
        </form>
        </div>
    </div>
<%
	}
%>
</body>
</html>