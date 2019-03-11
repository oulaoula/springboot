<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<#assign base=springMacroRequestContext.contextPath />
<head>
    <title>简易员工日志上报系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="${base}common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${base}css/login.css" media="all">
</head>
<body>
<div class="layui-canvs"></div>
<div class="layui-layout layui-layout-login">
    <h1>
        <strong>简易员工日志上报系统</strong>
        <em>Management System</em>
    </h1>
    <form action="/loginIn" method="post">
        <div class="layui-user-icon larry-login">
            <input type="text" placeholder="账号" class="login_txtbx" name="username"/>
        </div>
        <div class="layui-pwd-icon larry-login">
            <input type="password" placeholder="密码" class="login_txtbx" name="password"/>
        </div>
        <!-- <div class="layui-val-icon larry-login">
            <div class="layui-code-box">
                <input type="text" id="code" name="code" placeholder="验证码" maxlength="4" class="login_txtbx">
                <img src="images/verifyimg.png" alt="" class="verifyImg" id="verifyImg" onClick="javascript:this.src='xxx'+Math.random();">
            </div>
        </div> -->
        <div class="layui-submit larry-login">
            <input type="submit" value="立即登陆" class="submit_btn"/>
        </div>
    </form>
    <div class="layui-login-text">
        <p>© 2018-2019  版权所有 违规也没啥事</p>
    </div>
</div>
<script type="text/javascript" src="${base}common/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript" src="${base}js/login.js"></script>
<script type="text/javascript" src="${base}jsplug/jparticle.jquery.js"></script>
<script type="text/javascript">
    $(function(){
        $(".layui-canvs").jParticle({
            background: "#141414",
            color: "#E6E6E6"
        });
        //登录链接测试，使用时可删除
        $(".submit_btn").click(function(){
            location.href="index.html";
        });
    });
</script>
</body>
</html>