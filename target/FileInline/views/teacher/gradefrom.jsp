<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 不用密码
  Date: 2019/5/24
  Time: 22:33
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
        <input type="text" id="grade0" value="${sessionScope.grade0}" style="display: none">
        <input type="text" id="grade1" value="${sessionScope.grade1}" style="display: none">
        <input type="text" id="grade2" value="${sessionScope.grade2}" style="display: none">
        <input type="text" id="grade3" value="${sessionScope.grade3}" style="display: none">
        <input type="text" id="grade4" value="${sessionScope.grade4}" style="display: none">
        <div class="col-md-4">
            <table border="2">
                <caption style="font-weight: bold">成绩分布表</caption>
                <tr>
                    <th>0-59</th>
                    <th>60-70</th>
                    <th>70-80</th>
                    <th>80-90</th>
                    <th>90-100</th>
                </tr>
                <tr>
                    <th>${sessionScope.grade0}</th>
                    <th>${sessionScope.grade1}</th>
                    <th>${sessionScope.grade2}</th>
                    <th>${sessionScope.grade3}</th>
                    <th>${sessionScope.grade4}</th>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    function generateChart() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        /*var grade0=parseInt($('#grade0').val());*/
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '成绩分布图'
            },
            tooltip: {},
            legend: {
                data:['成绩']
            },
            xAxis: {
                data: ["0-59","60-70","70-80","80-90","90-100"],
                name:'分数段'
            },
            yAxis: {
                name:'人数'
            },
            series: [{
                name: '成绩',
                type: 'bar',
                barWidth: 60,
                /*data: [$('#grade0').val(), $('#grade1').val(), $('#grade2').val(), $('#grade3').val(), $('#grade4').val()]*/
                data: getData()
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
    function getData() {
        var grade0=parseInt($('#grade0').val());
        var grade1=parseInt($('#grade1').val());
        var grade2=parseInt($('#grade2').val());
        var grade3=parseInt($('#grade3').val());
        var grade4=parseInt($('#grade4').val());
        var seriesData = [];
        seriesData.push(grade0);
        seriesData.push(grade1);
        seriesData.push(grade2);
        seriesData.push(grade3);
        seriesData.push(grade4);
        return seriesData;
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