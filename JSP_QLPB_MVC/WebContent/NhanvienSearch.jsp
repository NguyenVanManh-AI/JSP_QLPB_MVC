<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="model.bean.Nhanvien_Phongban"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Tìm kiếm nhân viên</title>
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

            <h4 style="width:100%;text-align:center;color:#007bff">Tìm kiếm</h4>

            <form action="NhanvienSearchServlet" method="POST" style="display:flex">
                <% 
                    String search_infor = "";
                    if(request.getAttribute("search_infor") != null){
                    	search_infor = (String)request.getAttribute("search_infor");
                    }
               %>
               <input value='<%= search_infor %>' type='text' name='search_infor' class='form-control' aria-describedby='emailHelp' placeholder='Enter Text Search' style='font-weight:bold'>
                <button type="submit" name="submit" class="btn btn-primary" style="margin-left:10px">Submit</button>
            </form>

            <br><hr>

            <h4 style="width:100%;text-align:center;color:#007bff">Dữ Liệu Bảng Nhân Viên</h4>
            <table width='100%' class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Mã Nhân viên</th>
                        <th scope="col">Tên Nhân viên</th>
                        <th scope="col">Địa chỉ</th>
                        <th scope="col">Mã Phòng Phòng Ban</th>
                        <th scope="col">Tên Phòng Ban</th>
                        <th scope="col">Mô tả Phòng Ban</th>
                    </tr>
                </thead>
                <tbody>
<%
	List<Nhanvien_Phongban> nhanvien_Phongbans = (ArrayList<Nhanvien_Phongban>) request.getAttribute("nhanvien_Phongbans");
	if(nhanvien_Phongbans == null){
		response.sendRedirect("NhanvienSearchServlet");
	}
	else {
		for (int i = 0; i < nhanvien_Phongbans.size(); i++) {
%>
                <tr>
                <td scope='row'><%= nhanvien_Phongbans.get(i).getIDNV() %></td>
                <td><%= nhanvien_Phongbans.get(i).getHoten() %></td>
                <td><%= nhanvien_Phongbans.get(i).getDiachi() %></td>
                <td><%= nhanvien_Phongbans.get(i).getIDPB() %></td>	
                <td><%= nhanvien_Phongbans.get(i).getTenpb() %></td>	
                <td><%= nhanvien_Phongbans.get(i).getMota() %></td>	
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