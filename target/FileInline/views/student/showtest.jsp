<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/7
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
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
        <div class="col-md-12"align="center">
            <h2>当前实验任务</h2>
        </div>
    </div>
    <div class="row" style="background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr style="background-color: #7D9EC0">
                    <th>任务编号</th>
                    <th>任务名</th>
                    <th>发布时间</th>
                    <th>截至时间</th>
                    <th>课程编号</th>
                    <th>教师姓名</th>
                    <th>成绩比重</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${requestScope.pageInfotest.list}" var="orders">
                    <tr>
                        <th>${orders.id}</th>
                        <th>${orders.name}</th>
                        <th>${orders.statime}</th>
                        <th>${orders.endtime}</th>
                        <th>${orders.cid}</th>
                        <th>${orders.teacher.name}</th>
                        <th>${orders.percentage}</th>
                        <th><c:forEach items="${orders.stts}" var="stt">
                            ${stt.status}
                        </c:forEach> </th>
                        <th>
                            <a class="btn btn-info" href="Toreportshow?ttid=${orders.id}&tid=${orders.tid}&cid=${orders.cid}&sid=${sessionScope.bean.id}&endtime=${orders.endtime}" role="button">去完成</a>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/download?filename=${orders.filepath}" role="button" >下载指导书</a>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfotest.pageNum}页，共${pageInfotest.pages}页，共${pageInfotest.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findtestandt?page=1&sid=${sessionScope.bean.id}">首页</a></li>
                    <c:if test="${pageInfotest.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findtestandt?page=${pageInfotest.pageNum-1}&sid=${sessionScope.bean.id}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfotest.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfotest.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfotest.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/Findtestandt?page=${page}&sid=${sessionScope.bean.id}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfotest.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findtestandt?page=${pageInfotest.pageNum+1}&sid=${sessionScope.bean.id}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findtestandt?page=${pageInfotest.pages}&sid=${sessionScope.bean.id}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script type="text/javascript">
    function active() {
        alert("删除成功请刷新页面！");
        return false;

    }
    function test(endtime) {
        alert("实验");
        var nowtime = new Date();
        if(nowtime>endtime){
            alert("已过截止时间，请联系老师！");
            return false;
        }else {
            alert("实验");
            return false;
        }
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
