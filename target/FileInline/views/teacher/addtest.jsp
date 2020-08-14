<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/6
  Time: 16:07
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
                        <h1 style="text-align: center;">添加实验任务</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form"  name="reset" action="Addtest" id="editfrom" method="post" enctype="multipart/form-data" onsubmit="return check()">
                        <div class="form-group">
                            <label for="id" class="col-sm-2 control-label">任务编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="id" name="id" placeholder="请输入相应课程号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">任务名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" placeholder="请输入任务名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="time" class="col-sm-2 control-label">完成时长</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="time" name="time" placeholder="请输时长（天）">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="percentage" class="col-sm-2 control-label">成绩占比</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="percentage" name="percentage" placeholder="请输入0-1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cid" class="col-sm-2 control-label">课程ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="cid" name="cid" placeholder="请输入对课程ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tid" class="col-sm-2 control-label">教师ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="tid" name="tid" value="${sessionScope.bean.id}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="file" class="col-sm-2 control-label">上传指导书</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" id="file" name="file" multiple="multiple">
                            </div>
                        </div>
                        <div class="form-group" style="text-align: center">
                            <button class="btn btn-default" id="btn_register" type="submit">提交</button>
                            <button class="btn btn-default" type="reset">重置</button>
                        </div>
                        <h4>${resultt}</h4>
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
        {alert("请输入任务编号");return false;}
        if(reset.name.value==""||reset.name.value==null)
        {alert("请输入任务名");return false;}
        if(reset.time.value ==""|| reset.time.value==null)
        {alert("请输入时长");return false;}
        if(reset.cid.value ==""|| reset.cid.value==null)
        {alert("请输入对应课程ID");return false;}
        if(reset.file.value ==""|| reset.file.value==null)
        {alert("请上传指导书");return false;}
        if(reset.percentage.value ==""|| reset.percentage.value==null)
        {alert("请输入成绩比重");return false;}
       /* if(reset.id.value!=reset.cid.value){
            alert("任务编号与相应课程号不对应");return false;
        }*/
    }
</script>

</body>
</html>
