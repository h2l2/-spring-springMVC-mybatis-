<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/26
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            background-color: Gainsboro;
        }
    </style>
</head>
<body>
<div class="container" id="content">
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <h1 style="text-align: center;">重置密码</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" name="reset" role="form" action="Upteacherpd" id="editfrom" method="post" onsubmit="return check()">
                        <div class="form-group">
                            <label for="id" class="col-sm-2 control-label">教工号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="id" id="id" readonly="readonly" value="${sessionScope.bean.id}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pd" class="col-sm-2 control-label">旧密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="pd" placeholder="请输入旧密码" name="pd">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" placeholder="请输入新密码" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password1" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password1" id="password1" placeholder="请再次输入密码">
                            </div>
                        </div>
                        <div class="form-group" style="text-align: center">
                            <button class="btn btn-default" type="submit">确定</button>
                            <button class="btn btn-default">重置</button>
                        </div>
                        <h4>${resultpdt}</h4>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>
</body>
<script>
    $("#nav li:nth-child(7)").addClass("active")

    function check() {
        var Reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$/;
        if(reset.id.value==""||reset.id.value==null)
        {alert("请输入用户账号");return false;}
        if(reset.password.value==""||reset.password.value==null)
        {alert("请输入重置密码");return false;}
        if(reset.pd.value==""||reset.pd.value==null)
        {alert("请输入旧密码");return false;}
        if(reset.pd.value==reset.password.value){
            alert("新密码不能与旧密码相同！");
            return false;
        }
        if(reset.password1.value==""||reset.password1.value==null)
        {alert("请输入再次输入密码");return false;}
        if(reset.password.value != reset.password1.value)
        {alert("两次密码不正确");return false;}
        if(!Reg.test(reset.password.value)){
            alert("密码长度必须为6-15的数字字母组合！");
            return false;
        }
    }
</script>
</html>
