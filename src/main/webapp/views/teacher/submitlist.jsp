<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/12
  Time: 13:41
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
            <h2>已提交报告</h2>
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
                    <th>任教老师</th>
                    <th>实验课程</th>
                    <th>实验任务</th>
                    <th>评分</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.list}" var="orders" varStatus="status">
                <th>${status.count}</th>
                <th>${orders.sid}</th>
                <th>${orders.student.name}</th>
                <th>${orders.teacher.name}</th>
                <th>${orders.course.name}</th>
                <th>${orders.test.name}</th>
                <th>
                    <input type="text" value="${requestScope.grade}" id=${status.count}>
                    <input type="text" style="display: none" id="ttid" value="${orders.ttid}">
                    <input type="text" style="display: none" id="sid" value="${orders.sid}">
                </th>
                <%--<th><c:forEach items="${orders.stts}" var="stt">
                    ${stt.status}
                </c:forEach> </th --%>
                <th>
                    <a href="teopenword?reportname=${orders.name}&reportid=${orders.id}"onclick="POBrowser.openWindowModeless('teopenword?reportname=${orders.name}&reportid=${orders.id}','width=1200px;height=800px');">查看报告</a>
                    <a href="tedownloadfile?reportname=${orders.name}">下载报告</a>
                    <a href="#" onclick="submit(this.id)"id=${status.count}>提交成绩</a>
                </th>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    function submit(id) {
        var grade=document.getElementById(id).value;
            var json={"grade":grade,
                       "ttid":$('#ttid').val(),
                       "sid":$('#sid').val()
                     };
            var jsonstr=JSON.stringify(json);
            $.ajax({
                type:"post",
                url:"Submitgrade",
                contentType:"application/json",
                data:jsonstr,
                success:function(data){
                    alert(data.data);
                },
                error:function(){
                    alert("提交失败！");
                }
            });
    }
</script>
</body>
</html>
