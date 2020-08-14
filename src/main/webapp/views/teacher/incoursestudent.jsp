<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/29
  Time: 21:51
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
    <title>学生选课情况</title>
    <%
        pageContext.setAttribute("BASE_PATH", request.getContextPath());
    %>
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
            <h2>选课情况表</h2>
        </div>
    </div>
    <div class="row"style="margin-bottom:10px;">
        <a href="exportstudent?cid=${sessionScope.cid}" role="botton" class="glyphicon glyphicon-save">导出选课名单</a>
    </div>
    <div class="row"style="background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>专业</th>
                        <th>电话号码</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.pageInfosc.list}" var="orders" varStatus="status">
                           <tr>
                            <th>${status.count}</th>
                            <th>${orders.id}</th>
                            <th>${orders.name}</th>
                            <th>${orders.professiona}</th>
                            <th>${orders.phonenumber}</th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfosc.pageNum}页，共${pageInfosc.pages}页，共${pageInfosc.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 "align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findstudentbycid?page=1&cid=${sessionScope.cid}">首页</a></li>
                    <c:if test="${pageInfosc.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findstudentbycid?page=${pageInfosc.pageNum-1}&cid=${sessionScope.cid}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfosc.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfosc.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfosc.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/Findstudentbycid?page=${page}&cid=${sessionScope.cid}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfosc.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findstudentbycid?page=${pageInfosc.pageNum+1}&cid=${sessionScope.cid}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findstudentbycid?page=${pageInfosc.pages}&cid=${sessionScope.cid}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>
