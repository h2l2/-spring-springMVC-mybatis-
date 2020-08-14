<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/13
  Time: 0:26
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
            <h2>课程成绩录入</h2>
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
                    <th>联系方式</th>
                    <th>总成绩</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.pageInfogra.list}" var="orders" varStatus="status">
                <tr>
                    <th>${status.count}</th>
                    <th>${orders.id}</th>
                    <th>${orders.name}</th>
                    <th>${orders.professiona}</th>
                    <th>${orders.phonenumber}</th>
                    <th>
                    <c:forEach items="${requestScope.SC}" var="sc">
                        <c:if test="${orders.id==sc.sid}">
                            <input type="text" value="${sc.grade}" id=${orders.id}>
                            <input type="text" id="cid" value="${sessionScope.cid}" style="display: none">
                            <input type="text" id="sid" value="${orders.id}" style="display: none">
                        </c:if>
                    </c:forEach>
                    </th>
                    <th><a href="#" onclick="submit(this.id)" type="reset" id=${orders.id}>提交成绩</a></th>
                </tr>
                <c:forEach items="${requestScope.Test}" var="test">
                    <c:forEach items="${test.stts}" var="stt" varStatus="status1">
                        <c:if test="${orders.id==stt.sid}">
                            <tr style="background-color: #8c8c8c">
                                <th>#</th>
                                <th>任务编号</th>
                                <th>任务名</th>
                                <th>成绩</th>
                                <th>比重</th>
                                <th>实际得分</th>
                            </tr>
                            <tr style="background-color: #c12e2a">
                                <th>#</th>
                                <th>${test.id}</th>
                                <th>${test.name}</th>
                                <th>${stt.grade}</th>
                                <th>${test.percentage}</th>
                                <th>
                                    <input type="text" id="count" value="${sessionScope.count}" style="display: none">
                                    <input type="text" id="grade${status1.index}" value="${stt.grade}" style="display: none">
                                    <input type="text" id="biz${status1.index}" value="${test.percentage}" style="display: none">
                                    <input type="text" id="shij${status1.index}">
                                </th>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfogra.pageNum}页，共${pageInfogra.pages}页，共${pageInfogra.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Submitgradeall?page=1&cid=${sessionScope.cid}">首页</a></li>
                    <c:if test="${pageInfogra.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Submitgradeall?page=${pageInfogra.pageNum-1}&cid=${sessionScope.cid}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfogra.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfogra.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfogra.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/Submitgradeall?page=${page}&cid=${sessionScope.cid}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfogra.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/Submitgradeall?page=${pageInfogra.pageNum+1}&cid=${sessionScope.cid}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/Submitgradeall?page=${pageInfogra.pages}&cid=${sessionScope.cid}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script type="text/javascript">
    function jisuan() {
        for(var i=0;i<parseInt($('#count').val());i++){
            var a="grade"+i;
            var b="biz"+i;
            var c="shij"+i;
            var aa=document.getElementById(a).value;
            var bb=document.getElementById(b).value;
            var cc=parseInt(aa)*parseInt(bb);
            document.getElementById(c).value=cc;
            alert(a);
        }
    }
    function submit(id) {
        if(document.getElementById(id).value==""||document.getElementById(id).value==null) {
            alert("请输入成绩");
            return false;
        }else {
            var json={"grade":document.getElementById(id).value,
                "cid":$('#cid').val(),
                "sid":$('#sid').val()
            };
            var jsonstr=JSON.stringify(json);
            $.ajax({
                type:"post",
                url:"Submitgradeall1",
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
    }
    /*(function () {
        $('#shij1').click();
    })();*/
</script>
</body>
</html>
