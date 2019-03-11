<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>数据字典修改页面</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="../css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
		         <!-- 操作日志 -->
                <form class="layui-form" action="doUpdateBasDict.action" method="post">
                <input type="hidden" name="dictId" value="${basDict.dictId}">
				  <div class="layui-form-item">
				    <label class="layui-form-label">类别：</label>
				    <div class="layui-input-inline">
				      <input type="text" name="dictType"  required  lay-verify="required" autocomplete="off" class="layui-input" value="${basDict.dictType}">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">条目:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="dictItem"  required lay-verify="required"  autocomplete="off" class="layui-input" value="${basDict.dictItem}">
				   	 </div>
				  </div>
			
				  <div class="layui-form-item">
				    <label class="layui-form-label">值:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="dictValue" required lay-verify="required"  autocomplete="off" class="layui-input" value="${basDict.dictValue}">
				   	 </div>
				  </div>
				  
				  <div class="layui-form-item">
				    <label class="layui-form-label">是否可以编辑:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="dictIsEditable" required lay-verify="required"  autocomplete="off" class="layui-input" value="${basDict.dictIsEditable}">
					</div>
					 <div class="layui-form-mid layui-word-aux">0为不可编辑，1为可编辑</div>
				  </div>
				  
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
			     <!-- 完 -->
		</div>
	</div>
</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
</body>
</html>