<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/28
  Time: 21:02
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
        <div class="col-md-12" align="center">
            <h2>已选实验课程</h2>
        </div>
    </div>
    <div class="row" style="background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr style="background-color: #7D9EC0">
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>学年</th>
                    <th>学分</th>
                    <th>任教老师</th>
                    <th>批次</th>
                    <th>学时</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${requestScope.pageInfocid.list}" var="orders">
                    <tr>
                        <th>${orders.id}</th>
                        <th>${orders.name}</th>
                        <th>${orders.team}</th>
                        <th>${orders.credit}</th>
                        <th>
                                <%--<c:forEach items="${orders.teacher}" var="teacher">
                                    ${teacher.name}
                                </c:forEach>--%>
                                ${orders.teacher.name}
                        </th>
                        <th>${orders.batch}</th>
                        <th>${orders.studytime}</th>
                        <th>
                            <a class="btn btn-danger" href="deletescbysid?cid=${orders.id}&sid=${sessionScope.bean.id}" role="button" onclick="return confirm('你确定要退选此课程吗？')">取消选课</a>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfocid.pageNum}页，共${pageInfocid.pages}页，共${pageInfocid.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findallcoursebycid?page=1&sid=${sessionScope.bean.id}">首页</a></li>
                    <c:if test="${pageInfocid.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findallcoursebycid?page=${pageInfocid.pageNum-1}&sid=${sessionScope.bean.id}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfocid.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfocid.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfocid.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/Findallcoursebycid?page=${page}&sid=${sessionScope.bean.id}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfocid.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findallcoursebycid?page=${pageInfocid.pageNum+1}&sid=${sessionScope.bean.id}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findallcoursebycid?page=${pageInfocid.pages}&sid=${sessionScope.bean.id}">末页</a>
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
