<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/23
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <style type="text/css">
        a{ color:#3D3D3D;
            text-decoration:none;}
        a:hover{ color:#9400D3; text-decoration:underline;}
        a:active{ color:#30F;}
        #divv{
            color: #2d64b3;
        }
        body{
            background-color:Gainsboro;
        }
    </style>
</head>
<body>
<div class="container" id="divv">
    <ul>
        <p style="color:#0000CD;font-size:17px;"><b>公共资源</b></p>
        <li><a href="finpublicdrefileall?page=1" target="rightframe">查看资源</a></li>
        <li><a href="findrefilebysid?sid=${sessionScope.bean.id}" target="rightframe">上传资源文件</a></li>
        <li><a href="Towelcome" target="rightframe">查看公告</a></li>
        <br>
        <p style="color:#0000CD;font-size:17px;"><b>课程管理</b></p>
        <li><a href="Findallcoursebycid?sid=${sessionScope.bean.id}&page=1" target="rightframe" >我的实验</a></li>
        <li><a href="Findallcourseandt?sid=${sessionScope.bean.id}&page=1"target="rightframe">实验选课</a></li>
        <li><a href="Findtestandt?sid=${sessionScope.bean.id}&page=1" target="rightframe">我的任务
            <span class="badge">${sessionScope.span}</span> </a></li>
        <li><a href="Findgradeandc?sid=${sessionScope.bean.id}" target="rightframe">成绩查询</a></li>
        <br>
        <p style="color:#0000CD;font-size:17px;"><b>信息管理</b></p>
        <li><a href="showmessage?id=${sessionScope.bean.id}" target="rightframe">个人信息</a></li>
        <li><a href="Tosmessageadd" target="rightframe">个人信息录入</a></li>
        <li><a href="Tospdcorrect" target="rightframe">修改密码</a></li>
    </ul>
</div>
</body>
</html>
