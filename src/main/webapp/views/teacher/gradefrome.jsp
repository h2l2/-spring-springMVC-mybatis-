<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/14
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--引入标签--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <%
        pageContext.setAttribute("BASE_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="pageoffice.js" id="po_js_main"></script>
    <!-- jquery -->
    <script type="text/javascript" src="${BASE_PATH}/static/js/jquery-3.2.1.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style type="text/css">
        body{
            background-color: Gainsboro;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12" align="center">
            <h2>成绩单</h2>
        </div>
    </div>
    <div class="row"style="margin-bottom:10px;">
        <a href="Togradefrom" class="glyphicon glyphicon-search">查看成绩统计</a>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered"style="background-color: #FFFFFF">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>专业</th>
                    <th>联系方式</th>
                    <th>成绩</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.listgraf}" var="orders" varStatus="status">
                <th>${status.count}</th>
                <th>
                    ${orders.student.id}
                </th>
                <th>
                   ${orders.student.name}
                </th>
                <th>
                   ${orders.student.professiona}
                </th>
                <th>
                    ${orders.student.phonenumber}
                </th>
                <th>
                        ${orders.grade}
                </th>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
