<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- nếu có 2 thẻ như này lặp lại thì sẽ lỗi, mỗi thẻ một lần thôi -->
    
<%@page import="model.bean.Phongban"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cập nhật phòng ban</title>
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
            <section class="container wrapper" >
				<h2 class="display-6 pt-3">Cập Nhật</h2>
				<form action="PhongbanFormUpdateServlet" method="POST" style="width:50%;margin:auto" >

<%
	Phongban Phongban_detail = (Phongban) request.getAttribute("Phongban_detail");
	if(Phongban_detail == null){
		response.sendRedirect("PhongbanUpdate.jsp");
	}
	else {
%>
					<input type="text" hidden required style="font-weight:bold" name="oldIDPB" id="oldIDPB" class="form-control" value='<%= Phongban_detail.getIDPB() %>'>

                    <label for="IDPB">Mã phòng ban</label>
					<input type="text" disabled required style="font-weight:bold" name="IDPB" id="IDPB" class="form-control" value='<%= Phongban_detail.getIDPB() %>' >
					
                    <label for="Tenpb">Tên phòng ban</label>
					<input type="text" required style="font-weight:bold" name="Tenpb" id="Tenpb" class="form-control" value='<%= Phongban_detail.getTenpb() %>' >
					
                    <label for="Mota">Mô tả phòng ban</label>
					<input type="text" required style="font-weight:bold" name="Mota" id="Mota" class="form-control" value='<%= Phongban_detail.getMota() %>'>
					
                    <br>
                    <input type="submit" id="ok" name="update" class="btn btn-block btn-outline-primary" value="OK" >
					<input type="reset" name="reset" id="res" class="btn btn-block btn-outline-primary" value="RESET">
				</form>
			</section>
        </div>
    </div>
<% }} %>



</body>
</html>
<!-- 
    Note : Khi ta cho style disabled thì nó không lấy dữ liệu của input đó cho vào POST . 
    Chính vì thế nếu muốn có IDPB thì tạo thêm một input khác và cho nó hidden 
    - Về tính năng :      
        + Nếu ta muốn chỉnh sửa cả IDPB thì bỏ disabled đi và sẽ update mới vào where IDPB = '$oldIDPB' 
        + Còn nếu không cho phép chỉnh sửa thì cho disabled input IDPB và update Tenpb và Mota thì cũng where IDPB = '$oldIDPB' 
 -->
 