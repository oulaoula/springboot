<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>个人信息</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix">
			<!-- <form class="layui-form col-lg-5" action="" method="post"> -->
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">  
						<input type="text" name="title"  autocomplete="off"  class="layui-input layui-disabled" value="${user.usrName }" disabled="disabled" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所属角色</label>
					<div class="layui-input-block">
						<input type="text" name="username"  autocomplete="off" class="layui-input layui-disabled" value="${rolename.roleName }" disabled="disabled">
					</div>
				</div>
				<!-- <div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form> -->
		</div>
	</div>
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
         layui.upload({ 
             url: '' ,//上传接口 
             success: function(res){
              //上传成功后的回调 
              console.log(res) 
            } 
         });

	});
</script>
</body>
</html>