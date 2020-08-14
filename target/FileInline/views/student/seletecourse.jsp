<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/27
  Time: 17:18
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
            <h2>实验课程信息</h2>
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
                <c:forEach items="${requestScope.pageInfoc.list}" var="orders">
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
                            <input type="text" id="sid" value="${sessionScope.bean.id}" style="display: none">
                        </th>
                        <th>${orders.batch}</th>
                        <th>${orders.studytime}</th>
                        <th>
                            <a class="btn btn-primary" href="#" role="button" onclick="submit(this.id)" id="${orders.id}">选课</a>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfoc.pageNum}页，共${pageInfoc.pages}页，共${pageInfoc.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findallcourseandt?page=1&sid=${sessionScope.bean.id}">首页</a></li>
                    <c:if test="${pageInfoc.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findallcourseandt?page=${pageInfoc.pageNum-1}&sid=${sessionScope.bean.id}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfoc.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfoc.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfoc.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/Findallcourseandt?page=${page}&sid=${sessionScope.bean.id}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfoc.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Findallcourseandt?page=${pageInfoc.pageNum+1}&sid=${sessionScope.bean.id}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Findallcourseandt?page=${pageInfoc.pages}&sid=${sessionScope.bean.id}">末页</a>
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
    function submit(id) {
        var json={
                "cid":id,
                "sid":$('#sid').val()
        };
        var jsonstr=JSON.stringify(json);
        $.ajax({
                type:"post",
                url:"Addseletecourse",
                contentType:"application/json",
                data:jsonstr,
                success:function(data){
                    alert(data.data);
                },
                error:function(){
                    alert("提交异常！");
                }
        });
    }
</script>
<%
    String message = (String)request.getAttribute("message");

    if("".equals(message)||message==null){
        %>

        <%
    }else{
        %>
            <script type="text/javascript">
                alert("<%=message %>");
            </script>
        <%
    }
%>
</body>
</html>
