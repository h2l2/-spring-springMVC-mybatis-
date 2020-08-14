<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/30
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>拟合</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/bootstrap.min.js"></script>
    <!-- 引入 echarts.js -->
    <script src="static/js/echarts.js"></script>
</head>
<body>
<div style="width: 99%;margin-left: 1%">
    <ul id="myTab" class="nav nav-tabs" style="height:40px">
        <li class="active">
            <a href="#type1" data-toggle="tab" style="height:40px">
                &nbsp;&nbsp;计算机网络实验&nbsp;&nbsp;
            </a>
        </li>
        <li>
            <a href="#type2" data-toggle="tab" style="height:40px">
                &nbsp;&nbsp;C语言实验&nbsp;&nbsp;
            </a>
        </li>
        <li>
            <a href="#type3" data-toggle="tab" style="height:40px">
                &nbsp;&nbsp;C++实验&nbsp;&nbsp;
            </a>
        </li>
        <li>
            <a href="#type4" data-toggle="tab" style="height:40px">
                &nbsp;&nbsp;Android实验&nbsp;&nbsp;
            </a>
        </li>
    </ul>

    <div id="myTabContent" class="tab-content">

        <div class="tab-pane fade in active" id="type1" style="border-left: 1px solid #e3e3e3;border-right: 1px solid #e3e3e3;border-bottom: 1px solid #e3e3e3;min-height: 50px;padding: 0px 0px;">
            <div style="width: 100%;margin-top:1px;margin-bottom:1px;padding-top:3px;padding-left:1px;padding-bottom:1px;padding-right:1px;background-color:#FFFFFF;margin-left:auto;margin-right: auto;">
                <iframe  src="fromeaction" style="width:1112px;height:606px;" name="go" frameborder="0" ></iframe>
            </div>
        </div>

        <div class="tab-pane fade" id="type2" style="border-left: 1px solid #e3e3e3;border-right: 1px solid #e3e3e3;border-bottom: 1px solid #e3e3e3;min-height: 50px;padding: 0px 0px;">
            <div style="width: 100%;margin-top:1px;margin-bottom:1px;padding-top:3px;padding-left:1px;padding-bottom:1px;padding-right:1px;background-color:#FFFFFF;margin-left:auto;margin-right: auto;">
                <iframe  src="Cfromeaction" style="width:1112px;height:606px;" name="delay" frameborder="0" ></iframe>
            </div>
        </div>

        <div class="tab-pane fade" id="type3" style="border-left: 1px solid #e3e3e3;border-right: 1px solid #e3e3e3;border-bottom: 1px solid #e3e3e3;min-height: 50px;padding: 0px 0px;">
            <div style="width: 100%;margin-top:1px;margin-bottom:1px;padding-top:3px;padding-left:1px;padding-bottom:1px;padding-right:1px;background-color:#FFFFFF;margin-left:auto;margin-right: auto;">
                <iframe  src="Cjiafromeaction" style="width:1112px;height:606px;" name="ohba" frameborder="0" ></iframe>
            </div>
        </div>

        <div class="tab-pane fade" id="type4" style="border-left: 1px solid #e3e3e3;border-right: 1px solid #e3e3e3;border-bottom: 1px solid #e3e3e3;min-height: 50px;padding: 0px 0px;">
            <div style="width: 100%;margin-top:1px;margin-bottom:1px;padding-top:3px;padding-left:1px;padding-bottom:1px;padding-right:1px;background-color:#FFFFFF;margin-left:auto;margin-right: auto;">
                <iframe  src="Androidfromeaction" style="width:1112px;height:606px;" name="ohba" frameborder="0" ></iframe>
            </div>
        </div>

    </div>
</div>
</body>
</html>