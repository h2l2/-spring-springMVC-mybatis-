<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/6
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
        <div class="col-md-12" style="text-align: center">
            <h2>当前实验任务</h2>
        </div>
    </div>
    <div class="row"style="margin-bottom:10px;margin-top:20px;">
        <div class="col-md-12">
            <a href="Toaddtest" role="button" class="glyphicon glyphicon-plus">新添任务</a>
        </div>
    </div>
    <div class="row"style="background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr style="background-color: #7D9EC0">
                    <th>任务编号</th>
                    <th>任务名</th>
                    <th>发布时间</th>
                    <th>截至时间</th>
                    <th>成绩比重</th>
                    <th>课程编号</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${requestScope.pageInfote.list}" var="orders">
                    <tr>
                        <th>${orders.id}</th>
                        <th>${orders.name}</th>
                        <th>${orders.statime}</th>
                        <th>${orders.endtime}</th>
                        <th>${orders.percentage}</th>
                        <th>${orders.cid}</th>
                        <th>
                            <a  href="Findstudentbyttid?ttid=${orders.id}&page=1"  >提交情况</a>
                            <a  href="deletetest?id=${orders.id}" style="color: red" onclick="active()">删除</a>
                            <a  href="Totestupdate?id=${orders.id}"  >修改</a>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            第${pageInfote.pageNum}页，共${pageInfote.pages}页，共${pageInfote.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/ToTest?page=1&tid=${sessionScope.bean.id}">首页</a></li>
                    <c:if test="${pageInfote.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/ToTest?page=${pageInfote.pageNum-1}&tid=${sessionScope.bean.id}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfote.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfote.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfote.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/ToTest?page=${page}&tid=${sessionScope.bean.id}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfote.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/ToTest?page=${pageInfote.pageNum+1}&tid=${sessionScope.bean.id}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/ToTest?page=${pageInfote.pages}&tid=${sessionScope.bean.id}">末页</a>
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
<%
    String messaged = (String)request.getAttribute("messaged");

    if("".equals(messaged)||messaged==null){
%>

<%
}else{
%>
<script type="text/javascript">
    alert("<%=messaged %>");
</script>
<%
    }
%>
</body>
</html>
