<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/23
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>网络实验报告系统[${sessionScope.bean.id}]</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="static/font-awesome-4.7.0/css/font-awesome.css"/>
    <script src="static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="static/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="static/js/bootstrap.min.js" type="text/javascript"></script>
    <% session.removeAttribute("result");%>
</head>
<frameset rows="7%,*"  noresize="noresize">
    <frame src="Totop" noresize="noresize" frameborder="0" scrolling="no" name="topframe"/>
    <frameset cols="12%,*">
        <frame src="Toteacherlist" name="leftframe" target="rightframe">
        <frame src="Towelcome" name="rightframe">
    </frameset>
</frameset>
</html>
