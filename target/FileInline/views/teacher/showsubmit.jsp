<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/7
  Time: 18:40
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
    <title>任务提交情况</title>
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
            <h2>任务提交情况表</h2>
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
                    <th>学号</th>
                    <th>姓名</th>
                    <th>专业</th>
                    <th>电话号码</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.pageInfost.list}" var="orders" varStatus="status">
                <th>${status.count}</th>
                <th>${orders.id}</th>
                <th>${orders.name}</th>
                <th>${orders.professiona}</th>
                <th>${orders.phonenumber}</th>
                <th><c:forEach items="${orders.stts}" var="stt">
                    ${stt.status}
                </c:forEach> </th>
                <th>
                    <a href="Findroportbytest?sid=${orders.id}&ttid=${sessionScope.ttid}">查看提交记录</a>
                </th>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfost.pageNum}页，共${pageInfost.pages}页，共${pageInfost.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findstudentbyttid?page=1&ttid=${sessionScope.ttid}">首页</a></li>
                    <c:if test="${pageInfost.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findstudentbyttid?page=${pageInfost.pageNum-1}&ttid=${sessionScope.ttid}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfost.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfost.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfost.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/Findstudentbyttid?page=${page}&ttid=${sessionScope.ttid}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfost.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findstudentbyttid?page=${pageInfost.pageNum+1}&ttid=${sessionScope.ttid}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findstudentbyttid?page=${pageInfost.pages}&ttid=${sessionScope.ttid}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
