<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/29
  Time: 13:30
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
    </div>
    <div class="row">
        <div class="col-md-2 offset-md-10">
        </div>
    </div>
    <div class="row" style="background-color: #FFFFFF;margin-top:30px;">
        <div class="col-md-12">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>ID</th>
                    <th>文件名</th>
                    <th>上传时间</th>
                    <th>学生</th>
                    <th>老师</th>
                    <th>描述</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.pageInfore.list}" var="orders" varStatus="status">
                <th>${status.count}</th>
                <th>${orders.id}</th>
                <th>${orders.name}</th>
                <th>${orders.uptime}</th>
                <th>${orders.student.name}</th>
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
                    <a  href="#" role="button" onclick="submit1(this.id)" id="${orders.id}">不通过</a>
                    <a  href="#" role="button" onclick="submit(this.id)" id="${orders.id}" >通过</a>
                    <a  href="downloadrefile?name=${orders.name}" role="button">下载</a>
                </th>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfore.pageNum}页，共${pageInfore.pages}页，共${pageInfore.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/findrefileall?page=1">首页</a></li>
                    <c:if test="${pageInfore.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/findrefileall?page=${pageInfore.pageNum-1}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfore.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfore.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfore.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/findrefileall?page=${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfore.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/findrefileall?page=${pageInfore.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/findrefileall?page=${pageInfore.pages}">末页</a>
                    </li>
                </ul>
            </nav>
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
        var json={"id":id,
                    "status":"审核通过"
        };
        var jsonstr=JSON.stringify(json);
        $.ajax({
            type:"post",
            url:"updaterefilestatus",
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
    function submit1(id) {
        var json={"id":id,
            "status":"审核不通过"
        };
        var jsonstr=JSON.stringify(json);
        $.ajax({
            type:"post",
            url:"updaterefilestatus",
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
</script>
</body>
</html>
