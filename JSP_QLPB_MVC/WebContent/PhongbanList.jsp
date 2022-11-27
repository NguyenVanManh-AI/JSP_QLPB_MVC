<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.bean.Phongban"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Xem phòng ban</title>
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
            <h4 style="width:100%;text-align:center;color:#007bff">Dữ Liệu Bảng Phòng Ban</h4>
            <table width='100%' class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Mã Phòng Ban</th>
                        <th scope="col">Tên Phòng Ban</th>
                        <th scope="col">Mô tả</th>
                        <th scope="col">Xem Nhân Viên</th>
                    </tr>
                </thead>
                <tbody>
<%
	List<Phongban> phongbans = (ArrayList<Phongban>) request.getAttribute("phongbans");
	if(phongbans == null){
		response.sendRedirect("PhongbanListServlet");
	}
	else {
		for (int i = 0; i < phongbans.size(); i++) {
%>
                <tr>
                <td scope='row'><%= phongbans.get(i).getIDPB()%></td>
                <td><%= phongbans.get(i).getTenpb()%></td>
                <td><%= phongbans.get(i).getMota()%></td>
                <td><button type='button' class='btn btn-primary'><a style='color:white' href="NhanvienListServlet?IDPB=<%= phongbans.get(i).getIDPB()%>"><i class='fa-solid fa-eye'></i> Xem</a></button></td>
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