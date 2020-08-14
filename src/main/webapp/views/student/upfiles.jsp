<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/29
  Time: 12:32
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
            <h3>点击上传共享文件</h3>
        </div>
    </div>
    <div class="col-md-12" align="center" >
        <div class="row" style="border:solid;width:500px;height:400px;text-align:center;color: #8c8c8c">
            <div class="col-md-12">
                <form class="form-horizontal" role="form"  name="reset" action="Upfiles" id="editfrom" method="post" enctype="multipart/form-data" onsubmit="return check()">
                    <div class="form-group">
                        <label for="sid" class="col-sm-2 control-label">学生ID</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sid" name="sid" value="${sessionScope.bean.id}" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="file" class="col-sm-2 control-label">文件</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="file" name="file" multiple="multiple">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="about" class="col-sm-2 control-label">文件描述</label>
                        <div class="col-md-10">
                            <textarea class="weui_textarea" onkeyup="wordStatic(this);" maxlength="255" id="about" name="about" placeholder="请如实填写文件内容信息！" rows="8" cols="50"></textarea>
                            <span id="num">0</span>/255
                        </div>
                    </div>
                    <div class="form-group" style="text-align: center">
                        <button class="btn btn-default" id="btn_register" type="submit">提交</button>
                        <button class="btn btn-default" type="reset" style="display: none">重置</button>
                    </div>
                    <h4>${resultfs}</h4>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#nav li:nth-child(2)").addClass("active")

    function check() {
        if(reset.file.value ==""|| reset.file.value==null)
        {alert("请上传指导书");return false;}
        if($("#about").val()==""||$("#about").val()==null)
        {alert("请务必输入描述");return false;}
    }
    function wordStatic(input) {
        // 获取要显示已经输入字数文本框对象
        var content = document.getElementById('num');
        if (content && input) {
            // 获取输入框输入内容长度并更新到界面
            var value = input.value;
            // 将换行符不计算为单词数
            value = value.replace(/\n|\r/gi, "");
            // 更新计数
            content.innerText = value.length;
        }
    }
</script>

</body>
</html>
