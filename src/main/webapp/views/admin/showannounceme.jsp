<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/28
  Time: 21:55
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
    <div class="row"style="margin-bottom:10px;margin-top:20px;">
        <div class="col-md-12" align="center;">
            <a href="Toaddannounceme" style="font-weight: bolder" class="glyphicon glyphicon-plus">添加公告</a>
        </div>
    </div>
    <div class="row" style="background-color: #FFFFFF">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr style="background-color: #7D9EC0">
                    <th>序号</th>
                    <th>ID</th>
                    <th>标题</th>
                    <th>发布时间</th>
                    <th>内容</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${requestScope.pageInfoA.list}" var="orders" varStatus="status">
                    <tr>
                        <th>${status.count}</th>
                        <th>${orders.id}</th>
                        <th>${orders.name}</th>
                        <th>${orders.statime}</th>
                        <th>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever=${orders.content}>点击查看</button>
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
                            <a class="btn btn-primary" href="findfindannouncemebyid?id=${orders.id}" role="button">修改</a>
                            <a class="btn btn-danger" href="#" role="button" onclick="submit(this.id)" id="${orders.id}" >删除</a>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            第${pageInfoA.pageNum}页，共${pageInfoA.pages}页，共${pageInfoA.total}条记录
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/findannouncemeall?page=1">首页</a></li>
                    <c:if test="${pageInfoA.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/findannouncemeall?page=${pageInfoA.pageNum-1}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${pageInfoA.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfoA.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfoA.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${BASE_PATH}/findannouncemeall?page=${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfoA.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${BASE_PATH}/findannouncemeall?page=${pageInfoA.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${BASE_PATH}/findannouncemeall?page=${pageInfoA.pages}">末页</a>
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
            var json={"id":id
            };
            var jsonstr=JSON.stringify(json);
            $.ajax({
                type:"post",
                url:"deleteannounceme",
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
