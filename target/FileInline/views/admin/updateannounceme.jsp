<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/29
  Time: 0:50
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
                        <h1 style="text-align: center;">修改公告</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="id" class="col-sm-4 control-label">ID</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" name="id" value="${sessionScope.announceme.id}" readonly="readonly" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-4 control-label">标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name" value="${sessionScope.announceme.name}" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contentt" class="col-sm-4 control-label">内容</label>
                        <div class="col-md-10">
                            <textarea class="weui_textarea" onkeyup="wordStatic(this);" maxlength="255" id="contentt"  rows="8" cols="85">${sessionScope.announceme.content}</textarea>
                            <span id="num">0</span>/255
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10">
                            <button class="btn btn-default" id="btn_register" type="submit" onclick="submit()">提交修改</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function submit() {
        if($("#contentt").val()==""||$("#contentt").val()==null) {
            alert("请输入公告内容");
            return false;
        }else if($("#name").val()==""||$("#name").val()==null){
            alert("请输入公告标题");
            return false;
        }else {
            var json={"content":$("#contentt").val(),
                "name":$("#name").val(),
                "id":$("#id").val()
            };
            var jsonstr=JSON.stringify(json);
            $.ajax({
                type:"post",
                url:"updateannounceme",
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