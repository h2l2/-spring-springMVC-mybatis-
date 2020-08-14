<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/30
  Time: 0:00
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
            <h3>点击上传Excel文件</h3>
        </div>
    </div>
    <div class="col-md-12" align="center" >
        <div class="row" style="border:solid;width:500px;height:400px;text-align:center;color: #8c8c8c">
            <div class="col-md-12">
                <form class="form-horizontal" role="form"  name="reset" action="importExcel" id="editfrom" method="post" enctype="multipart/form-data" onsubmit="return check()">
                    <div class="form-group">
                        <label for="file" class="col-sm-2 control-label">文件</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="file" name="file" multiple="multiple">
                        </div>
                    </div>
                    <div class="form-group" style="text-align: center">
                        <button class="btn btn-default" id="btn_register" type="submit">提交</button>
                        <button class="btn btn-default" type="reset" style="display: none">重置</button>
                    </div>
                    <h4>${requestScope.result}</h4>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#nav li:nth-child(1)").addClass("active")

    function check() {
        if(reset.file.value ==""|| reset.file.value==null)
        {alert("请上传指导书");return false;}
    }
</script>

</body>
</html>