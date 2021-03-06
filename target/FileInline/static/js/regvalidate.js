$(document).ready(function() {
    $("#professiona").click(function() {
        var $professional = $("#professiona"),
            professionalVal = $.trim($professiona.val());
        if (professionalVal.length == 0) {
            $("#professionainfo .notice").text("请输入所在专业");
        } else {
            $("#professionainfo .notice").empty();
        }
    }),
    $("#username").click(function() {
        var $username = $("#username"),
        usernameVal = $.trim($username.val());
        if (usernameVal.length == 0) {
            $("#usernameinfo .notice").text("请输入学号！");
        } else {
            $("#usernameinfo .notice").empty();
        }
    }),
    $("#password").click(function() {
        var $password = $("#password"),
        passwordVal = $.trim($password.val());
        if (passwordVal.length == 0) {
            $("#passwordinfo .notice").text("请输入6-16位数字、字母或常用符号，字母区分大小写");
        } else {
            $("#passwordinfo .notice").empty();
        }
    }),
    $("#password2").click(function() {
        var $password2 = $("#password2"),
        password2Val = $.trim($password2.val());
        if (password2Val.length == 0) {
            $("#password2info .notice").text("请输入6-16位数字、字母或常用符号，字母区分大小写");
        } else {
            $("#password2info .notice").empty();
        }
    }),
    $("#name").click(function() {
        var $name = $("#name"),
            nameVal = $.trim($name.val());
        if (nameVal.length == 0) {
            $("#nameinfo .notice").text("请输入姓名");
        } else {
            $("#nameinfo .notice").empty();
        }
    }),

    $("#professiona,#username,#password,#password2").change(function() {
        $("#professionainfo .notice").empty();
        $("#usernameinfo .notice").empty();
        $("#passwordinfo .notice").empty();
        $("#password2info .notice").empty();
    }),

    $("#regform").validate({
            username: {
                required: true,
                minlength: 3,
                maxlength: 20,
                remote: {
                    url:"checkUser.do",
                    type:"get",
                    contentType: "application/json;charset=utf-8",
                    data:{
                        username:function(){return $("#username").val();}
                    },
                    dataFilter: function(data, type) {
                        if (data == 1)
                            return false;
                        else
                            return true;
                    }
                }
            },
            password: {
                required: true,
                minlength: 6,
                maxlength: 16
            },
            password2: {
                required: true,
                minlength: 6,
                maxlength: 16,
                equalTo: "#password"
            },
            captcha: {
                required: true,
                remote: {
                    url:"checkCaptcha.do",
                    type:"get",
                    contentType: "application/json;charset=utf-8",
                    data:{
                        captcha:function(){return $("#captcha").val();}
                    },
                    dataFilter: function(data, type) {
                        if (data == 0)
                            return false;
                        else
                            return true;
                    }
                }
            }
        },
        messages: {
            professiona: {
                required: "请输入一个有效的邮箱地址",
                professiona: "请输入一个有效的邮箱地址",
                remote: "该邮箱已被注册"
            },
            username: {
                required: "请输入一个3-20位的用户名",
                minlength: "用户名至少包含3位字符",
                maxlength: "用户名不得超过20位字符",
                remote: "该用户已被占用"
            },
            password: {
                required: "请输入一个有效的密码",
                minlength: "密码至少要包含6位字符",
                maxlength: "密码不得超过16位字符"
            },
            password2: {
                required: "请输入一个有效的密码",
                minlength: "密码至少要包含6位字符",
                maxlength: "密码不得超过16位字符",
                equalTo: "两次密码输入不一致"
            },
            captcha: {
                required: "请输入验证码",
                remote: "验证码错误"
            }
        },
        errorElement: "span",
        errorPlacement: function(error, element) {
            // Add the `help-block` class to the error element
            error.addClass("help-block");

            // Add `has-feedback` class to the parent div.form-group
            // in order to add icons to inputs
            element.parents(".input-group").addClass("has-feedback");

            if (element.prop("type") === "checkbox") {
                error.appendTo(element.parent("label").parent("div").parent("div").next("div"));
            } else {
                //error.insertAfter( element );
                error.appendTo(element.parent("div").parent("div").next("div"));
            }

            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if (!element.next("span")[0]) {
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(element);
            }
        },
        success: function(label, element) {
            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if (!$(element).next("span")[0]) {
                $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
            }
        },
        highlight: function(element, errorClass, validClass) {
            $(element).parents(".input-group").addClass("has-error").removeClass("has-success");
            $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).parents(".input-group").addClass("has-success").removeClass("has-error");
            $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
        }
    });
});


