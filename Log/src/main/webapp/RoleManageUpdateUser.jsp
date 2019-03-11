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
	    <div class="layui-tab">
		         <!-- 操作日志 -->
                <form class="layui-form" action="RoleManagedoUpdate.action" method="post">
                 <div class="layui-form-item">
				    <label class="layui-form-label">用户Id：</label>
				    <div class="layui-input-block">
				      <input type="text" name="usrId"   autocomplete="off" class="layui-input layui-disabled"  disabled="disabled" value="${user.usrId }">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">用户名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="usrName" required  lay-verify="required" autocomplete="off" class="layui-input" value="${user.usrName }">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">密码框</label>
				    <div class="layui-input-inline">
				      <input type="text" name="usrPassword" required lay-verify="required"  autocomplete="off" class="layui-input" value="${user.usrPassword }">
				   	 </div>
				   	  <div class="layui-form-mid layui-word-aux">如果不修改密码，可以不输入</div>
				  </div>
			
				  <div class="layui-form-item">
				    <label class="layui-form-label">选择角色</label>
				    <div class="layui-input-block">
				       <select name="usrRoleId" lay-verify="required">
				        <option value="r001">r001 系统管理员</option>
				        <option value="r002">r002 销售主管 </option>
				        <option value="r003">r003 客户经理</option>
				        <option value="r004">r004 高管</option>
				        <option value="r005">r005 超级管理员</option>
				      </select> 
				    </div>
				  </div>
				 <br>
				  <br>
				   <br>
				    <br>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <input type="submit" class="layui-btn" lay-submit lay-filter="formDemo" value="提交">
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				  </div>
				</form>
 				<br>
				  <br>
				   <br>
				    <br>
			     <!-- 完 -->
		    </div>
		</div>
	
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="js/newslist.js"></script>
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
});
</script>
</body>
</html>