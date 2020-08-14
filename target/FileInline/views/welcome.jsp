<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/4/23
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--引入标签--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <%
        pageContext.setAttribute("BASE_PATH", request.getContextPath());
    %>
    <!-- jquery -->
    <script type="text/javascript" src="${BASE_PATH}/static/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="${BASE_PATH}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${BASE_PATH}/static/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            background-color: Gainsboro;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12" align="center">
           <h3>点击公告标题可查看内容</h3>
        </div>
    </div>
    <div class="col-md-12" align="center" >
        <div class="row" style="border:solid;width:500px;height:400px;text-align:center;background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>序号</th>
                    <th>公告内容</th>
                </tr>
                <c:forEach items="${sessionScope.pageInfoAA.list}" var="orders" varStatus="status">
                    <tr>
                        <th>${status.count}</th>
                        <th>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever=${orders.content}>${orders.name}</button>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">内容：</h4>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    </div>
        <h1 style="text-align: center">欢迎使用网络实验报告系统</h1>
</div>
<script type="text/javascript">
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text('公告内容： ' + recipient)
        modal.find('.modal-body input').val(recipient)
    });
</script>
</body>
</html>
