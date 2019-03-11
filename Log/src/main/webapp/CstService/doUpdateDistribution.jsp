<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>服务管理分配销售代表页面</title>
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
		        <form action="doupdateService.action" method="post"  class="layui-form layui-form-pane">
					<div class="modal-body">
						<div class="layui-form-item">
							<label class="layui-form-label">当前客户Id:</label>
							<div class="layui-input-inline">
								<input type="text" name="svrId" required lay-verify="required"  readonly="readonly" autocomplete="off" class="layui-input" value="${custService.svrId}"" title="${custService.svrId}"">
							</div>
						  </div>
						  <div class="layui-form-item">
							<label class="layui-form-label">分配给:</label>
							<div class="layui-input-block">
								<c:forEach items="${userByRoleId}" var="userByRoleId">
									<input type="radio" name="svrDueTo" required lay-verify="required"  autocomplete="off" class="layui-input" value="${userByRoleId.usrName}" title="${userByRoleId.usrName}">
									<input type="hidden" name="svrDueId" value="${userByRoleId.usrId}"><!--同时得到分配人Id  -->
									<input type="hidden" name="svrDealId" value="${userByRoleId.usrId}"><!--分配的销售代表，就是处理人  -->
									<input type="hidden" name="svrDealBy" value="${userByRoleId.usrName}">
								</c:forEach>
							</div>
						  </div>
						<input type="hidden" name="svrStatus" value="3"><!-- 已分配，将状态该改为3 -->
					</div>
					<div class="layui-form-item">
					    <div class="layui-input-block">
					      <input type="submit" class="layui-btn" lay-submit lay-filter="formDemo" value="提交">
					      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
					    </div>
				    </div>
				</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript">
layui.use('form', function(){
	  
	  //但是，如果你的HTML是动态生成的，自动渲染就会失效
	  //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
	  form.render();
	}); 
</script>
</body>
</html>