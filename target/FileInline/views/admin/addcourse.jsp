<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/25
  Time: 20:52
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
                        <h1 style="text-align: center;">添加实验课程</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form"  name="reset" action="Addcourse" id="editfrom" method="post" onsubmit="return check()">
                        <div class="form-group">
                            <label for="id" class="col-sm-2 control-label">课程号</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="id" name="id" placeholder="请输入课程号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">课程名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" placeholder="请输入课程名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="team" class="col-sm-2 control-label">学年</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="team" name="team" placeholder="请输入学年">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="credit" class="col-sm-2 control-label">学分</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="credit" name="credit" placeholder="请输入学分">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="batch" class="col-sm-2 control-label">批次</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="batch" name="batch" placeholder="请输入批次">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="studytime" class="col-sm-2 control-label">学时</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="studytime" name="studytime" placeholder="请输入课程学时">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacherid" class="col-sm-2 control-label">任课教师ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="teacherid" name="teacherid" placeholder="请输入对应教师ID">
                            </div>
                        </div>
                        <p id="msg_pwd" style="margin-left: 150px"></p>
                        <div class="form-group" style="text-align: center">
                            <button class="btn btn-default" id="btn_register" type="submit">提交</button>
                            <button class="btn btn-default" type="reset">重置</button>
                        </div>
                        <h4>${resultc}</h4>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    $("#nav li:nth-child(7)").addClass("active")

    function check() {
        var Reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$/;
        if(reset.id.value==""||reset.id.value==null)
        {alert("请输入课程号");return false;}
        if(reset.name.value==""||reset.name.value==null)
        {alert("请输入课程名");return false;}
        if(reset.team.value==""||reset.team.value==null)
        {alert("请输入相应学年");return false;}
        if(reset.credit.value ==""|| reset.credit.value==null)
        {alert("请输入相应课程学分");return false;}
        if(reset.batch.value ==""|| reset.batch.value==null)
        {alert("请输入相应课程批次");return false;}
        if(reset.studytime.value ==""|| reset.studytime.value==null)
        {alert("请输入课程学时");return false;}
        if(reset.teacherid.value ==""|| reset.teacherid.value==null)
        {alert("请输入对应教师ID");return false;}
    }
</script>
</body>
</html>

