<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<style>
*{
    list-style: none;
    text-decoration: none;
    margin:0;
    padding:0;
}
li{
    font-size:14px;
    font-weight: bold;
}
ul {
    padding: 10px 20px;
}
.alert{
    margin-bottom: 3px;
}
</style>
<div>
<ul>

<% 
    String disp = "block";
    if (session.getAttribute("username") == null || session.getAttribute("username").equals("")){
    	disp = "none";
    }
%>
<li class='alert alert-primary' role='alert' ><a href="Login.jsp"><i class='fa-solid fa-house-user'></i> Trang chủ</a></li> 
<li class='alert alert-primary' role='alert' ><a href="NhanvienList.jsp"><i class='fa-solid fa-users'></i> Xem nhân viên</a></li> 
<li class='alert alert-primary' role='alert' ><a href="PhongbanList.jsp"><i class='fa-sharp fa-solid fa-bars'></i> Xem Phòng ban</a></li> 
<li class='alert alert-primary' role='alert' ><a href="NhanvienSearch.jsp"><i class='fa-solid fa-magnifying-glass'></i> Tìm kiếm</a></li> 
<li class='alert alert-primary' role='alert' style='display:<%= disp %>'><a href="PhongbanUpdate.jsp"><i class='fa-solid fa-pen-to-square'></i> Cập nhật thông tin</a></li> 
<li class='alert alert-primary' role='alert' style='display:<%= disp %>'><a href="NhanvienDelete.jsp"><i class='fa-solid fa-trash-can'></i> Xóa thông tin</a></li> 
<li class='alert alert-primary' role='alert' style='display:<%= disp %>'><a href="NhanvienDeleteAll.jsp"><i class='fa-solid fa-trash'></i> Xóa tất cả</a></li> 
<li class='alert alert-primary' role='alert' ><a href="Help.jsp"><i class='fa-solid fa-circle-info'></i> Trợ giúp chương trình</a></li>  
<li class='alert alert-danger' role='alert'  style='display:<%= disp %>'><a href="LogoutServlet"><i class='fa-solid fa-right-from-bracket'></i> Đăng xuất</a></li> 
</ul>
</div>
</html>
