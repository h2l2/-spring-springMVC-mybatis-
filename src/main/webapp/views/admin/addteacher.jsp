<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/24
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
                        <h1 style="text-align: center;">添加教师</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form"  name="reset" action="AddTeacher" id="editfrom" method="post" onsubmit="return check()">
                        <div class="form-group">
                            <label for="id" class="col-sm-2 control-label">工号</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="id" name="id" placeholder="请输入教工号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password1" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password1" name="password1" placeholder="请再次输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password1" class="col-sm-2 control-label">联系方式</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="phonnumber" name="phonnumber" placeholder="老师的电话联系">
                            </div>
                        </div>
                        <p id="msg_pwd" style="margin-left: 150px"></p>
                        <div class="form-group" style="text-align: center">
                            <button class="btn btn-default" id="btn_register" type="submit">提交</button>
                            <button class="btn btn-default" type="reset">重置</button>
                            <a href="Toimportexcel" role="button" class="btn btn-default">导入Excel表</a>
                        </div>
                        <h4>${resultt}</h4>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    /*$(document).ready(function(){
        $('#password').on('input propertychange', function() {
            //input propertychange即实时监控键盘输入包括粘贴
            var pwd = $.trim($(this).val());
            //获取this，即ipwd的val()值，trim函数的作用是去除空格
            var rpwd = $.trim($("#password1").val());
            if(rpwd!=""){
                if(pwd==""&&rpwd==""){
                    //若都为空，则提示密码不能为空，为了用户体验（在界面上用required同时做了处理）
                    $("#msg_pwd").html("密码不能为空");

                }
                else{
                    if(pwd==rpwd){                                 //相同则提示密码匹配
                        $("#msg_pwd").html("两次密码匹配通过");
                        $("#btn_register").attr("disabled",false); //使按钮无法点击
                    }else{                                          //不相同则提示密码匹配
                        $("#msg_pwd").html("两次密码匹配不通过");
                        $("#btn_register").attr("disabled",true);
                    }
                }}
        })
    });

    //由于是两个输入框，所以进行两个输入框的几乎相同的判断
    $(document).ready(function(){
        $('#password1').on('input propertychange', function() {
            var pwd = $.trim($(this).val());
            var rpwd = $.trim($("#password").val());
            if(pwd==""&&rpwd==""){
                $("#msg_pwd").html("密码不能为空");
                // alert("密码不能为空！");
            }
            else{
                if(pwd==rpwd){
                    $("#msg_pwd").html("两次密码匹配通过");
                    $("#btn_register").attr("disabled",false);
                }else{
                    $("#msg_pwd").html("两次密码匹配不通过");
                    $("#btn_register").attr("disabled",true);
                }
            }
        })
    });*/
    $("#nav li:nth-child(5)").addClass("active")

    function check() {
        var Reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$/;
        if(reset.id.value==""||reset.id.value==null)
        {alert("请输入用户账号");return false;}
        if(reset.password.value==""||reset.password.value==null)
        {alert("请输入重置密码");return false;}
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
</body>
</html>
