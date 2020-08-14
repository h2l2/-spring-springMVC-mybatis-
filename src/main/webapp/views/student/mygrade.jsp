<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/14
  Time: 13:43
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
    <!-- Bootstrap -->
    <link href="${BASE_PATH}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${BASE_PATH}/static/js/bootstrap.min.js"></script>
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
            <h2>我的成绩</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 offset-md-10">
        </div>
    </div>
    <div class="row" style="background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>课号</th>
                    <th>课程</th>
                    <th>学期</th>
                    <th>学分</th>
                    <th>学时</th>
                    <th>成绩</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.listgra}" var="orders" varStatus="status">
                <th>${status.count}</th>
                <th>
                    <c:forEach items="${orders.courses}" var="course">
                        <c:if test="${orders.cid==course.id}">
                            ${course.id}
                        </c:if>
                    </c:forEach>
                </th>
                <th>
                    <c:forEach items="${orders.courses}" var="course">
                        <c:if test="${orders.cid==course.id}">
                            ${course.name}
                        </c:if>
                    </c:forEach>
                </th>
                <th>
                    <c:forEach items="${orders.courses}" var="course">
                        <c:if test="${orders.cid==course.id}">
                            ${course.team}
                        </c:if>
                    </c:forEach>
                </th>
                <th>
                    <c:forEach items="${orders.courses}" var="course">
                        <c:if test="${orders.cid==course.id}">
                            ${course.credit}
                        </c:if>
                    </c:forEach>
                </th>
                <th>
                    <c:forEach items="${orders.courses}" var="course">
                        <c:if test="${orders.cid==course.id}">
                            ${course.studytime}
                        </c:if>
                    </c:forEach>
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
