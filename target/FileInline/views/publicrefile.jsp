<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/29
  Time: 14:57
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
            <h3>公共资源模块框点击可下载</h3>
        </div>
    </div>
    <div class="col-md-12" align="center">
        <div class="row" style="border:solid;width:1000px;height:350px;text-align:center;background-color: #FFFFFF">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>序号</th>
                        <th>ID</th>
                        <th></th>
                        <th>文件名</th>
                        <th>上传时间</th>
                        <th>学生</th>
                        <th>老师</th>
                        <th>描述</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${requestScope.pageInfore.list}" var="orders" varStatus="status">
                        <th>${status.count}</th>
                        <th>${orders.id}</th>
                        <th>
                            <input type="text" id="id" value="${orders.id}" style="display: none">
                        </th>
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
                        <th>
                            <a  href="downloadrefile?name=${orders.name}" role="button">下载</a>
                        </th>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/finpublicdrefileall?page=1">首页</a></li>
                    <c:if test="${pageInfore.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/finpublicdrefileall?page=${pageInfore.pageNum-1}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfore.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfore.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfore.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/finpublicdrefileall?page=${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfore.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/finpublicdrefileall?page=${pageInfore.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/finpublicdrefileall?page=${pageInfore.pages}">末页</a>
                    </li>
                </ul>
            </nav>
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
        modal.find('.modal-title').text('文件描述： ' + recipient)
        modal.find('.modal-body input').val(recipient)
    });
</script>
</body>
</html>
