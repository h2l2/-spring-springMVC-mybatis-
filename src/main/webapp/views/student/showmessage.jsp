<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/26
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            background-color: Gainsboro;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3 style="text-align: center">个人信息</h3>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <ul class="list-group">
                    <li class="list-group-item">
                        <span class="badge">${requestScope.student.id}</span>
                        学号：
                    </li>
                    <li class="list-group-item">
                        <span class="badge">${requestScope.student.name}</span>
                        姓名：
                    </li>
                    <li class="list-group-item">
                        <span class="badge">${requestScope.student.professiona}</span>
                        专业：
                    </li>
                    <li class="list-group-item">
                        <span class="badge">${requestScope.student.phonenumber}</span>
                        电话号码：
                    </li>
                    <li class="list-group-item">
                        <span class="badge">${requestScope.student.dormitory}</span>
                        宿舍号：
                    </li>
                </ul>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
</body>
</html>
