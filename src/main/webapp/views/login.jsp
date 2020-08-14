<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>网络实验报告系统登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="gbk2312">
    <link rel="stylesheet" type="text/css" href="style.css" media="all">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="static/css/login.css">--%>
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
    <style type="text/css">
        html,body {
            font-size: 14px;
            font-family: "微软雅黑", Helvetica, Tahoma, Arial, sans-serif;
            color: #000;
            background-color: #30333F;
            margin: 0;
            padding: 0;
        }
        img {
            border: 0;
        }
        .cf:before,.cf:after {
            display: table;
            content: "";
        }
        .cf:after {
            clear: both;
        }
        .cf {
            *zoom: 1;
        }
        canvas{
            position: fixed;
            top: 0px;
        }
        #word{
             text-align:center;
            font-size: 10px;
            font-weight:bold;
         }
        #word1{
            text-align:center;
        }
        #word2{
            text-align:center;
        }
        #from{
            text-align:center;
            /*background: #56666B;*/
            color: #fff;
        }
        #dl{
            text-align:center;
        }
        a:link,a:visited,a:hover {font-size:12px;color:white;
                              }
    </style>
</head>
<body id="login-page">
<canvas width="1293" height="717"></canvas>
    <div id="word" class="page-header">
        <h1 style="color: #2d64b3">网络实验报告系统</h1>
    </div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div id="word2">
        <h1 style="color: #2d64b3">
           ${result}
        </h1>
    </div>
<div class="container" id="top-panel">
    <div class="row" style="margin-top: 100px; ">
        <div class="col-md-3"></div>
        <div class="col-md-6" id="login-box">
            <form class="form-horizontal"  action="Logincheck" id="from" method="post">
                <div class="form-group">
                    <label for="id" class="col-sm-3 control-label" >用户</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="id" placeholder="请输入学号或教工号" name="id">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-7">
                    <div class="checkbox">
                        <label class="checkbox-inline">
                            <input type="radio" name="role"  value="admin" checked>管理员
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="role"  value="teacher">老师
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="role" value="student">学生
                        </label>
                    </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-default btn-info" id="dl">登录</button>
                <a class="btn btn-primary" href="Toregister" role="button">注册</a>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
<script>
    /**
     * Created by Administrator on 2016/6/29.
     */
    var canvas = document.querySelector('canvas'),
        ctx = canvas.getContext('2d')
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    ctx.lineWidth = .3;
    ctx.strokeStyle = (new Color(150)).style;
    var mousePosition = {
        x: 30 * canvas.width / 100,
        y: 30 * canvas.height / 100
    };
    var dots = {
        nb: 750,
        distance: 50,
        d_radius: 100,
        array: []
    };
    function colorValue(min) {
        return Math.floor(Math.random() * 255 + min);
    }
    function createColorStyle(r,g,b) {
        return 'rgba(' + r + ',' + g + ',' + b + ', 0.8)';
    }
    function mixComponents(comp1, weight1, comp2, weight2) {
        return (comp1 * weight1 + comp2 * weight2) / (weight1 + weight2);
    }
    function averageColorStyles(dot1, dot2) {
        var color1 = dot1.color,
            color2 = dot2.color;

        var r = mixComponents(color1.r, dot1.radius, color2.r, dot2.radius),
            g = mixComponents(color1.g, dot1.radius, color2.g, dot2.radius),
            b = mixComponents(color1.b, dot1.radius, color2.b, dot2.radius);
        return createColorStyle(Math.floor(r), Math.floor(g), Math.floor(b));
    }

    function Color(min) {
        min = min || 0;
        this.r = colorValue(min);
        this.g = colorValue(min);
        this.b = colorValue(min);
        this.style = createColorStyle(this.r, this.g, this.b);
    }

    function Dot(){
        this.x = Math.random() * canvas.width;
        this.y = Math.random() * canvas.height;

        this.vx = -.5 + Math.random();
        this.vy = -.5 + Math.random();

        this.radius = Math.random() * 2;

        this.color = new Color();
    }

    Dot.prototype = {
        draw: function(){
            ctx.beginPath();
            ctx.fillStyle = this.color.style;
            ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
            ctx.fill();
        }
    };

    function createDots(){
        for(i = 0; i < dots.nb; i++){
            dots.array.push(new Dot());
        }
    }

    function moveDots() {
        for(i = 0; i < dots.nb; i++){

            var dot = dots.array[i];

            if(dot.y < 0 || dot.y > canvas.height){
                dot.vx = dot.vx;
                dot.vy = - dot.vy;
            }
            else if(dot.x < 0 || dot.x > canvas.width){
                dot.vx = - dot.vx;
                dot.vy = dot.vy;
            }
            dot.x += dot.vx;
            dot.y += dot.vy;
        }
    }

    function connectDots(){
        for(i = 0; i < dots.nb; i++){
            for(j = i; j < dots.nb; j++){
                i_dot = dots.array[i];
                j_dot = dots.array[j];

                if((i_dot.x - j_dot.x) < dots.distance && (i_dot.y - j_dot.y) < dots.distance && (i_dot.x - j_dot.x) > - dots.distance && (i_dot.y - j_dot.y) > - dots.distance){
                    if((i_dot.x - mousePosition.x) < dots.d_radius && (i_dot.y - mousePosition.y) < dots.d_radius && (i_dot.x - mousePosition.x) > - dots.d_radius && (i_dot.y - mousePosition.y) > - dots.d_radius){
                        ctx.beginPath();
                        ctx.strokeStyle = averageColorStyles(i_dot, j_dot);
                        ctx.moveTo(i_dot.x, i_dot.y);
                        ctx.lineTo(j_dot.x, j_dot.y);
                        ctx.stroke();
                        ctx.closePath();
                    }
                }
            }
        }
    }

    function drawDots() {
        for(i = 0; i < dots.nb; i++){
            var dot = dots.array[i];
            dot.draw();
        }
    }

    function animateDots() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        moveDots();
        connectDots();
        drawDots();
        requestAnimationFrame(animateDots);
    }
    document.querySelector('canvas').addEventListener('mousemove',function(e){
        mousePosition.x = e.pageX;
        mousePosition.y = e.pageY;
    })

    document.querySelector('canvas').addEventListener('mouseleave',function(e){
        mousePosition.x = canvas.width/2;
        mousePosition.y = canvas.height / 2;
    })

    createDots();
    requestAnimationFrame(animateDots);

</script>
</body>
</html>