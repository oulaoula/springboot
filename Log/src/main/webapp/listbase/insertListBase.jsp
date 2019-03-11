<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>数据字典添加页面</title>
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
                <form class="layui-form" action="insertBasDict.action" method="post">
				  <div class="layui-form-item">
				    <label class="layui-form-label">类别：</label>
				    <div class="layui-input-inline">
				      <input type="text" name="dictType" placeholder="请输入类别" required  lay-verify="required" autocomplete="off" class="layui-input" value="">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">条目:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="dictItem" placeholder="请输入条目" required lay-verify="required"  autocomplete="off" class="layui-input" value="">
				   	 </div>
				  </div>
			
				  <div class="layui-form-item">
				    <label class="layui-form-label">值:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="dictValue" placeholder="请输入值" required lay-verify="required"  autocomplete="off" class="layui-input" value="">
				   	 </div>
				  </div>
				  
				  <div class="layui-form-item">
				    <label class="layui-form-label">是否可以编辑:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="dictIsEditable" required lay-verify="required"  autocomplete="off" class="layui-input" value="">
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
 				
				    <br>
			     <!-- 完 -->
		    </div>
		 </div>
</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),
              laypage = layui.laypage;
          laypage({
					cont: 'page',
					pages:${pageInfo.pages} //总页数
						,
					groups: 3 //连续显示分页数
						,
					curr:${pageInfo.pageNum}//当前页
						,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							location.href = 'listbase.action?pageNum='+curr;
						}
					}
				});

    });
</script>
</body>
</html>