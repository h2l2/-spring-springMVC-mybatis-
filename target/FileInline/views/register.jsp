<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>注册页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="style.css" media="all">
    <script src="static/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="static/css/custom.css" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style>
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
    </style>
</head>
<body id="login-page">
<canvas width="1293" height="717"></canvas>
<div class="container">
    <div id="wrap">
        <div id="top_content">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <div class="col-sm-12">
                <p class="text-center blog_subtitle" style="text-indent:0em;margin-top:10px">网络实验报告系统</p>
                <p class="text-center blog_subtitle" style="text-indent:0em;margin-top:10px">注册界面</p>
                <h4 class="text-center sub_title"> <span> <a href="Tologin">登录</a> <b>&middot;</b> <a class="active" href="Toregister">注册</a> </span> </h4>
            </div>
            <div id="content">
                <form action="AddStudent" method="post" id="regform" class="col-sm-offset-4 col-sm-8 form-horizontal" role="form" name="reset" onsubmit="return check()">
                    <fieldset>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="text" class="form-control input-lg input_size" id="id" name="id" placeholder="请输入学号" required="required" />
                                </div>
                            </div>
                           <%-- <div id="studentidinfo" class="col-sm-6">
                                <span class="notice"></span>
                            </div>--%>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-heart"></i></span>
                                    <input type="text" class="form-control input-lg input_size " id="name" name="name"  placeholder="请输入姓名" required="required" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                    <input type="text" class="form-control input-lg input_size" id="professiona" name="professiona" placeholder="请输入所在专业" required="required" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="password" class="form-control input-lg input_size" name="password" id="password" placeholder="请输入密码" required="required" />
                                </div>
                            </div>
                           <%-- <div id="passwordinfo" class="col-sm-6">
                                <span class="notice"></span>
                            </div>--%>

                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="password" class="form-control input-lg input_size" name="password1" id="password1" placeholder="请再次输入密码" required="required" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <input type="text" class="form-control input-lg input_size " id="phonenumber" name="phonenumber"  placeholder="请输入联系方式" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <input type="submit" class="btn btn-info btn-lg btn-block bottom-space"  id="btn_register" value="注册" />
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#nav li:nth-child(7)").addClass("active")

    function check() {
        var Reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$/;
        var reg=/^[0-9]{10}/;
        var regg=/^[0-9]{11}/;
        if(reset.id.value==""||reset.id.value==null)
        {alert("请输入用户账号");return false;}
        if(reset.password.value==""||reset.password.value==null)
        {alert("请输入密码");return false;}
        if(reset.password1.value==""||reset.password1.value==null)
        {alert("请输入再次输入密码");return false;}
        if(reset.password.value != reset.password1.value)
        {alert("两次密码不正确");return false;}
        if(!Reg.test(reset.password.value)){
            alert("密码长度必须为6-15的数字字母组合！");
            return false;
        }
        if(!reg.test(reset.id.value)){
            alert("请输入学号！");
            return false;
        }
        if(!regg.test(reset.phonenumber.value)){
            alert("电话号码格式不对（11位）！");
            return false;
        }
    }
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