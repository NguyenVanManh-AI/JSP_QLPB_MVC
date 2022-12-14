<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Help</title>
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
    <div id="main">
        <div id="sidebar">
            <%@ include file="Sidebar.jsp" %>
        </div>
        <div id="content">
            <h4 style="width:100%;text-align:center;color:#007bff;font-size:60px;">HELP ¯\_(ツ)_/¯</h4><hr>
        </div>
    </div>

</body>
</html>