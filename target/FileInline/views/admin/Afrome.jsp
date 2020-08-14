<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/30
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/bootstrap.min.js"></script>
    <!-- 引入 echarts.js -->
    <script src="static/js/echarts.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
        <div id="main" style="width: 600px;height:400px;" class="col-md-8"></div>
        <div class="col-md-4">
            <table border="2">
                <caption style="font-weight: bold">选课人数统计表</caption>
                <tr>
                    <c:forEach items="${requestScope.Alist}" var="cid">
                        <th>${cid}</th>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${requestScope.Alist1}" var="count">
                        <th>${count}</th>
                    </c:forEach>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    function generateChart() {
        var list =[[${Alist}]];
        var list1 = [[${Alist1}]];
        var data = list.toString();
        var data1 = list1.toString();
        var da = data.split(",");
        var da1 = data1.split(",");
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '选课人数统计图'
            },
            tooltip: {},
            legend: {
                data:['人数']
            },
            xAxis: {
                data:da,
                name:'课号'
            },
            yAxis: {
                name:'人数'
            },
            series: [{
                name: '人数',
                type: 'bar',
                /*data: [$('#grade0').val(), $('#grade1').val(), $('#grade2').val(), $('#grade3').val(), $('#grade4').val()]*/
                data: da1,
                barWidth: 70,
                itemStyle:{
                    normal:{
                        color:'#99CCCC'
                    }
                }
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
    /* function test() {
        /!* alert($('#grade0').val());*!/
         var a = $('#grade0').val();
         alert(a);
     }*/
    window.onload = generateChart;
</script>
</body>
</html>
