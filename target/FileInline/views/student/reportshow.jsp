<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/10
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="pageoffice.js" id="po_js_main"></script>
    <!-- jquery -->
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap -->
   <%-- <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/bootstrap.min.js"></script>--%>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style type="text/css">
        [class*="col-"]{
            padding: 5px;

        }
        #text{
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h3>当前实验报告模板</h3>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width: 800px">
            <%--指示灯--%>
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>
            <%--轮播内容--%>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="static/images/b.jpg" alt="...">
                    <div class="carousel-caption">
                        <a role="button" style="color: white" onclick="test1()">选择此模板</a>
                    </div>
                </div>
                <div class="item">
                    <img src="static/images/a.jpg" alt="...">
                    <div class="carousel-caption">
                        <a role="button" style="color: white" class="text" onclick="test2()">选择此模板</a>
                    </div>
                </div>
                <div class="item">
                    <img src="static/images/c.jpg" alt="...">
                    <div class="carousel-caption">
                        <a role="button" style="color: white" onclick="test3()">选择此模板</a>
                    </div>
                </div>
                <div class="item">
                    <img src="static/images/b.jpg" alt="...">
                    <div class="carousel-caption">
                        <a role="button" style="color: white" onclick="test5()">选择此模板</a>
                    </div>
                </div>
            </div>
                <%--控制按钮--%>
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="control-labelcol-sm-offset-2"></div>
        <div class="row">

        </div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-9" style="margin-outside: 10px">
                截至提交时间：<input type="text" value="${sessionScope.endtime}" id="endtime" readonly="readonly"/>
                <a href="openword" role="button" class="btn btn-primary"data-toggle="tooltip" data-placement="bottom" title="选择模板后点击两次可在线编辑"
                   onclick="POBrowser.openWindowModeless('openword','width=1200px;height=800px');">预览编辑实验报告</a>
                <a role="button" class="btn btn-success"data-toggle="tooltip" data-placement="bottom" title="编辑保存后可提交" onclick="return test4()">提交实验报告</a>
                <a  href="downloadfile" role="button" class="btn btn-warning"data-toggle="tooltip" data-placement="bottom" title="请先编辑模板再下载，否则返回空白页面！">下载报告</a>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    <script type="text/javascript">
        function test1() {
            var json={"moban":"moban1.doc"};
            var jsonstr=JSON.stringify(json);
            $.ajax({
                type:"post",
                url:"receivemoban",
                contentType:"application/json",
                data:jsonstr,
                success:function(data){
                    alert(data.data);
                },
                error:function(){
                    alert("选择失败，请重新选择");
                }
            });
        }
        function test2() {
            var json={"moban":"moban2.doc"
                     };
            var jsonstr=JSON.stringify(json);
            $.ajax({
                type:"post",
                url:"receivemoban",
                contentType:"application/json",
                data:jsonstr,
                success:function(data){
                    alert(data.data);
                },
                error:function(){
                    alert("选择失败，请重新选择");
                }
            });
        }
        function test3() {
            var json={"moban":"moban3.doc"};
            var jsonstr=JSON.stringify(json);
            $.ajax({
                type:"post",
                url:"receivemoban",
                contentType:"application/json",
                data:jsonstr,
                success:function(data){
                    alert(data.data);
                },
                error:function(){
                    alert("选择失败，请重新选择");
                }
            });
        }
        function test5() {
            var json={"moban":"moban4.doc"};
            var jsonstr=JSON.stringify(json);
            $.ajax({
                type:"post",
                url:"receivemoban",
                contentType:"application/json",
                data:jsonstr,
                success:function(data){
                    alert(data.data);
                },
                error:function(){
                    alert("选择失败，请重新选择");
                }
            });
        }
        function test4() {
            var nowtime = new Date();
            var endtime = $('#endtime').val();
            var endtime1=new Date(endtime);
            if(nowtime.getTime()>endtime1.getTime()){
                alert("已过截止时间，请联系老师！");
                return false;
            }else {
                var json={"moban":"1"};
                var jsonstr=JSON.stringify(json);
                $.ajax({
                    type:"post",
                    url:"upreport",
                    contentType:"application/json",
                    data:jsonstr,
                    success:function(data){
                        alert(data.data);
                    },
                    error:function(){
                        alert("请先选择模板并编辑！");
                    }
                });
            }
        }
    </script>
    <%
        String message = (String) request.getSession().getAttribute("mes");

        if(message == ""){
    %>

    <%
    }else{
    %>
    <script type="text/javascript">
        alert("<%=message %>");
    </script>
    <%
            request.getSession().setAttribute("mes", "");
        }
    %>

</body>
</html>
