<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	 <form class="layui-form" action="linkmanDoUpdate.action" method="post">
	    <div class="layui-tab">
		         <!-- 操作日志 -->
                 <div class="layui-form-item">
				    <label class="layui-form-label">联系人编号:</label>
				    <div class="layui-input-block">
				      <input type="text" name="lkmId"   autocomplete="off" class="layui-input layui-disabled"    value="${linkman.lkmId}">
				    </div>
				  </div>
				  
				  
				  <div class="layui-form-item">
				    <label class="layui-form-label">客户编号:</label>
				    <div class="layui-input-block">
				    <select name="lkmCustNo" lay-verify="required" >
				    <c:forEach items="${customers}" var="customer">
				    	<c:if test="${customer.custNo eq linkman.lkmCustNo }">
				    		<option value="${customer.custNo}" selected="selected">${customer.custName}</option>
				    	</c:if>
				    	<c:if test="${customer.custNo ne linkman.lkmCustNo }">
				    		<option value="${customer.custNo}">${customer.custName}</option>
				    	</c:if>
				    		
				    </c:forEach>
				      </select> 
				    </div>
				  </div>
			
				  <div class="layui-form-item">
				    <label class="layui-form-label">联系人名称:</label>
				   <div class="layui-input-block">
				      <input type="text" name="lkmName" required lay-verify="required"  autocomplete="off" class="layui-input" value="${linkman.lkmName}">
				   	 </div>
				    </div>
				    
				     <div class="layui-form-item">
				    <label class="layui-form-label">性别:</label>
				   <div class="layui-input-block">
				   <select name="lkmSex" lay-verify="required" >
				   <c:if test="${linkman.lkmSex eq '男'}">
				   			<option value="男" selected="selected">男</option>
				       		 <option value="女">女</option>
				   </c:if>
				     <c:if test="${linkman.lkmSex eq  '女'}">
				   			<option value="男">男</option>
				       		 <option value="女" selected="selected">女</option>
				   </c:if>
				        
				      </select> 
				   	 </div>
				    </div>
				    
				     <div class="layui-form-item">
				    <label class="layui-form-label">职位:</label>
				   <div class="layui-input-block">
				      <input type="text" name="lkmPostion" required lay-verify="required"  autocomplete="off" class="layui-input" value="${linkman.lkmPostion}">
				   	 </div>
				    </div>
				    
				     <div class="layui-form-item">
				    <label class="layui-form-label">办公室电话:</label>
				   <div class="layui-input-block">
				      <input type="text" name="lkmTel" required lay-verify="required"  autocomplete="off" class="layui-input" value="${linkman.lkmTel}">
				   	 </div>
				    </div>
				    
				     <div class="layui-form-item">
				    <label class="layui-form-label">手机:</label>
				   <div class="layui-input-block">
				      <input type="text" name="lkmMobile" required lay-verify="required"  autocomplete="off" class="layui-input" value="${linkman.lkmMobile}">
				   	 </div>
				    </div>
				    
				     <div class="layui-form-item">
				    <label class="layui-form-label">备注:</label>
				   <div class="layui-input-block">
				      <input type="text" name="lkmMemo" required lay-verify="required"  autocomplete="off" class="layui-input" value="${linkman.lkmMemo}">
				   	 </div>
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

layui.use('form', function(){
	  
	  //但是，如果你的HTML是动态生成的，自动渲染就会失效
	  //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
	  form.render();
	}); 

</script>
</body>
</html>