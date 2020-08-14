<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/9
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"
         import="java.util.*,com.zhuozhengsoft.pageoffice.*"
         pageEncoding="UTF-8"%>
<%
    PageOfficeCtrl poCtrl=(PageOfficeCtrl)request.getAttribute("poCtrl");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>网络实验报告系统在线编辑</title>
    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="pageoffice.js" id="po_js_main"></script>
</head>
<body>
<script type="text/javascript">
    function Save() {
        document.getElementById("PageOfficeCtrl1").WebSave();
        window.external.close();//关闭POBrowser窗口
    }
</script>
<div style="width:100%; height:100%;">
    <%=poCtrl.getHtmlCode("PageOfficeCtrl1")%>
</div>
</body>
</html>
