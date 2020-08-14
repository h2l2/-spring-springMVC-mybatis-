<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/24
  Time: 20:28
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
    <title>老师用户信息</title>
    <%
        pageContext.setAttribute("BASE_PATH", request.getContextPath());
    %>
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
            <h2>老师用户信息</h2>
        </div>
    </div>
    <div class="row" style="background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr style="background-color: #7D9EC0">
                    <th>账号（教工号）</th>
                    <th>密码</th>
                    <th>姓名</th>
                    <th>电话号码</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${sessionScope.pageInfo.list}" var="orders">
                    <tr>
                        <th>${orders.id}</th>
                        <th>${orders.password}</th>
                        <th>${orders.name}</th>
                        <th>${orders.phonnumber}</th>
                        <th>
                            <a class="btn btn-danger" href="Deleteteacher?id=${orders.id}" role="button"onclick="active()">删除</a>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfo.pageNum}页，共${pageInfo.pages}页，共${pageInfo.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/FindTeacherall?page=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/FindTeacherall?page=${pageInfo.pageNum-1}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfo.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfo.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/FindTeacherall?page=${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/FindTeacherall?page=${pageInfo.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/FindTeacherall?page=${pageInfo.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script type="text/javascript">
    function active() {
        alert("删除成功请刷新页面！");

    }
</script>
</body>
</html>

