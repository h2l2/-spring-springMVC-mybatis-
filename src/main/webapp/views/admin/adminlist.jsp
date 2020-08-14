<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/23
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- jquery -->
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $(function() {
            var height=document.documentElement.clientHeight;
            document.getElementById('iframe-page-content').style.height=height+'px';
        });

        var menuClick = function(menuUrl) {
            $("#iframe-page-content").attr('src',menuUrl);
        };
    </script>
    <style type="text/css">
        a{ color:#3D3D3D; text-decoration:none;}
        a:hover{ color:#9400D3; text-decoration:underline;}
        a:active{ color:#30F;}
        #divv{
            color: #2d64b3;
        }
        body{
            background-color:Gainsboro;
        }
    </style>
</head>
<body>
<div class="container" id="divv">
    <ul>
        <a style="color:#0000CD;font-size:17px;"><b>资源管理</b></a>
        <li><a href="findrefileall?page=1" target="rightframe">文件资源审核</a></li>
        <li><a href="findannouncemeall?page=1" target="rightframe">公告管理</a></li>
        <li><a href="Tofrome" target="rightframe">查看数据统计</a></li>
        <br>
        <p style="color:#0000CD;font-size:17px;"><b>课程管理</b></p>
        <li><a href="Toaddcourse" target="rightframe">添加实验课程</a></li>
        <li><a href="FindCourseall" target="rightframe">查看实验课程信息</a></li>
        <br>
        <p style="color:#0000CD;font-size:17px;"><b>用户管理</b></p>
        <li><a href="Toaddteacher" target="rightframe">添加老师用户</a></li>
        <li><a href="FindTeacherall" target="rightframe">查看老师用户</a></li>
        <li><a href="FindStudentall" target="rightframe">查看学生用户</a></li>
        <li><a href="Toupdcorrect" target="rightframe">修改用户密码</a></li>
    </ul>
    <%--<div id="sidebar" class="col-md-4 column">
        <!-- 创建菜单树 -->
        <div class="col-md-12">
            <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
                <li>
                    <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>资源管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 10px;">
                        <li><a href="add.asp" target="rightframe"><i class="glyphicon glyphicon-user"></i>文件资源审核</a></li>
                        <li><a href="Todemo" target="rightframe"><i class="glyphicon glyphicon-th-list"></i>公告管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#systemSetting1" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>index1
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="systemSetting1" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>ccc</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-edit"></i>ddd</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-eye-open"></i>eee</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>--%>
</div>
</body>
</html>
