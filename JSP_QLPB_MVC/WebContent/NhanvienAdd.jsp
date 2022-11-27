<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Chèn Thông tin Nhân Viên</title>
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
            <h4 style="width:100%;text-align:center;color:#007bff">Chèn Thông tin Nhân Viên</h4><hr>
            <section class="container wrapper" >
            
                <!-- error -->
                <% if(request.getAttribute("mess_add_error") != null){ %>
                    <div class="alert alert-danger" role="alert"><i class="fa-solid fa-triangle-exclamation"></i> <%= request.getAttribute("mess_add_error") %></div>
                <% } %>

                <% if(request.getAttribute("mess_add_success") != null){ %>
                    <div class="alert alert-success" role="alert"><i class="fa-solid fa-check-double"></i> <%= request.getAttribute("mess_add_success") %></div>
                <% } %>
                
				<form action="NhanvienAddServlet" method="POST" style="width:50%;margin:auto" >
					<label for="IDNV">Mã Nhân Viên</label>
					<input type="text" required style="font-weight:bold" name="IDNV" id="IDNV" class="form-control" >
                    <span class="d-none" style="color:red" id="spIDNV">Mã Nhân Viên không được để trống</span> 

					<label for="Hoten">Họ Tên</label>
					<input type="text" required style="font-weight:bold" name="Hoten" id="Hoten" class="form-control" >
                    <span class="d-none" style="color:red" id="spHoten">Họ Tên không được để trống</span>

                    <label for="IDPB">Mã Phòng Ban</label>
					<input type="text" required style="font-weight:bold" name="IDPB" id="IDPB" class="form-control" >
                    <span class="d-none" style="color:red" id="spIDPB">Mã Phòng Ban không được để trống</span>

                    <label for="Diachi">Địa Chỉ</label>
					<input type="text" required style="font-weight:bold" name="Diachi" id="Diachi" class="form-control" >
                    <span class="d-none" style="color:red" id="spDiachi">Mô tả không được để trống</span>

					<br>
					<input type="submit" id="ok" name="add_nv" class="btn btn-block btn-outline-primary" value="OK" >
					<input type="reset" name="reset" id="res" class="btn btn-block btn-outline-primary" value="RESET">
				</form>
			</section>
        </div>
    </div>


<% } %>

</body>
</html>