<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/27
  Time: 15:39
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
                        <h1 style="text-align: center;">完善个人信息</h1>
                    </div>
                </div>
                <div class="panel-body">
                        <div class="form-group">
                            <label for="id" class="col-sm-2 control-label">教工号</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="id" name="id" readonly="readonly" value="${sessionScope.bean.id}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" value="${sessionScope.bean.name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phonnumber" class="col-sm-2 control-label">联系方式</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="phonnumber" name="phonnumber" value="${sessionScope.bean.phonnumber}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="facultyde" class="col-sm-2 control-label">院系</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="facultyde" name="facultyde" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">职称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="title" name="title" >
                            </div>
                        </div>
                        <div class="form-group" style="text-align: center;margin-top:20px;">
                            <a href="#" onclick="submit()" type="reset" role="button" class="btn btn-info">提交更新</a>
                        </div>
                </div>

            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    function submit() {
        if($('#id').val()==""||$('#id').val()==null) {
            alert("请输入教工号");
            return false;
        }else if($('#name').val()==""||$('#name').val()==null) {
            alert("请输入姓名");
            return false;
        }else if($('#phonnumber').val()==""||$('#phonnumber').val()==null) {
            alert("请输入联系方式");
            return false;
        }else if($('#facultyde').val()==""||$('#facultyde').val()==null) {
            alert("请输入院系");
            return false;
        }else if($('#title').val()==""||$('#title').val()==null) {
            alert("请输入职称");
            return false;
        } else {
            var json={"id":$('#id').val(),
                "name":$('#name').val(),
                "phonnumber":$('#phonnumber').val(),
                "facultyde":$('#facultyde').val(),
                "title":$('#title').val()
            };
            var jsonstr=JSON.stringify(json);
            $.ajax({
                type:"post",
                url:"Updateteacher",
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
</script>
</body>
</html>
