<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/29
  Time: 4:11
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
    <title>任务提交情况</title>
    <%
        pageContext.setAttribute("BASE_PATH", request.getContextPath());
    %>
    <!-- jquery -->
    <script type="text/javascript" src="${BASE_PATH}/static/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap -->
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style type="text/css">
        body{
            background-color: Gainsboro;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row" style="margin-bottom:10px;margin-top:20px;">
        <div class="col-md-12" align="center;">
            <a href="Toupfile"style="font-weight: bolder" class="glyphicon glyphicon-open" role="button">上传文件</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 offset-md-10">
        </div>
    </div>
    <div class="row"style="background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>ID</th>
                    <th>文件名</th>
                    <th>上传时间</th>
                    <th>上传人</th>
                    <th>描述</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.list}" var="orders" varStatus="status">
                <th>${status.count}</th>
                <th>${orders.id}</th>
                <th>${orders.name}</th>
                <th>${orders.uptime}</th>
                <th>${orders.teacher.name}</th>
                <th>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever=${orders.about}>点击查看</button>
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
                <th>${orders.status}</th>
                <th>
                    <a class="btn btn-danger" href="#" role="button" onclick="submit(this.id)" id="${orders.id}">删除</a>
                </th>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
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
    function submit(id) {
        var json={"id":id
        };
        var jsonstr=JSON.stringify(json);
        $.ajax({
            type:"post",
            url:"deleterefilebyid",
            contentType:"application/json",
            data:jsonstr,
            success:function(data){
                alert(data.data);
            },
            error:function(){
                alert("删除异常！");
            }
        });
    }
</script>
</body>
</html>