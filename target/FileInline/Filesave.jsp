<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/10
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.zhuozhengsoft.pageoffice.*,
    com.hjb.utils.*" %>
<html>
<head>
    <title>Title</title>
    <%
        FileSaver fs = new FileSaver(request, response);
        String newFilename = UUID.randomUUID()+"_"+fs.getFileName();
        fs.saveToFile(request.getServletContext().getRealPath("upload/") +"/"+ newFilename);
        fs.close();
        request.getSession().setAttribute("newfilename",newFilename);
        /*Wordtohtml wordtohtml = new Wordtohtml();
        wordtohtml.wordtohtm(newFilename,request);*/
    %>
</head>
<body>

</body>
</html>
