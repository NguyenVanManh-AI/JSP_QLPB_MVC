<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
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
        .wrapper {
            padding-bottom: 20px;
        }
	</style>
    </style>
</head>
<body>

<% 
    if (session.getAttribute("username") == null || session.getAttribute("username").equals("")){
%>

    <div id="main">
        <div id="sidebar">
            <%@ include file="Sidebar.jsp" %>
        </div>
        <div id="content">
            <h4 style="width:100%;text-align:center;color:#007bff">Login</h4><hr>
            <p class="text-center"><span style="color:gray">(username,password = vanmanh)</span></p>
            <div>
                <section class="container wrapper" >
                    <form action="CheckLoginServlet" method="POST" style="width:30%;margin:auto">
                        <label for="username">Username</label>
                        <input type="text" required name="username" id="username" class="form-control">
                        <br>
                        <label for="password">Password</label>
                        <input type="password" required name="password" id="password" class="form-control">
                        <br>
                        <input type="submit" class="btn btn-block btn-outline-primary" value="login">
                    </form>
                </section>
            </div>
        </div>
    </div>
<%

}
else { // nếu đã đăng nhập rồi thì về trang Nhanvien List 
	response.sendRedirect("NhanvienList.jsp");
}
%>
</body>
</html>