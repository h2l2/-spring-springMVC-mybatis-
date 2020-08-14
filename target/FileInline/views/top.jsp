<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/22
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.hjb.daomain.Student" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>注册页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <%--<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="static/font-awesome-4.7.0/css/font-awesome.min.css" />
    <script src="static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="static/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="static/js/bootstrap.min.js" type="text/javascript"></script>--%>
    <script src="../static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../static/css/custom.css" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container" id="top" style="width:100%">
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <a  class="navbar-brand">网络实验报告系统(${sessionScope.role})</a>
        </div>
        <p class="navbar-text " style=" line-height:20px">欢迎 ID：${sessionScope.bean.id} 姓名：${sessionScope.bean.name}</p>
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Tologinout" target="_top">退出登录</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
</body>
</html>
