<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/14
  Time: 14:40
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
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <h2 style="text-align: center">我的实验课</h2>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div class="row"style="background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr style="background-color: #7D9EC0">
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>学年</th>
                    <th>学分</th>
                    <th>批次</th>
                    <th>学时</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${requestScope.pageInfot.list}" var="orders">
                    <tr>
                        <th>${orders.id}</th>
                        <th>${orders.name}</th>
                        <th>${orders.team}</th>
                        <th>${orders.credit}</th>
                        <th>${orders.batch}</th>
                        <th>${orders.studytime}</th>
                        <th>
                            <a class="btn btn-info" href="Findgradeands?cid=${orders.id}" role="button" >查看成绩单</a>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfot.pageNum}页，共${pageInfot.pages}页，共${pageInfot.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findteacherallcourse1?page=1&tid=${sessionScope.bean.id}">首页</a></li>
                    <c:if test="${pageInfot.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findteacherallcourse1?page=${pageInfot.pageNum-1}&tid=${sessionScope.bean.id}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfot.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfot.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfot.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/Findteacherallcourse1?page=${page}&tid=${sessionScope.bean.id}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfot.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findteacherallcourse1?page=${pageInfot.pageNum+1}&tid=${sessionScope.bean.id}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findteacherallcourse1?page=${pageInfot.pages}&tid=${sessionScope.bean.id}">末页</a>
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
