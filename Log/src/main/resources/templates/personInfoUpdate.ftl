<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<#assign base=springMacroRequestContext.contextPath />
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="${base}common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="${base}common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="${base}common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="${base}css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
		         <!-- 操作日志 -->
                <form class="layui-form" action="/PersonInfoDoUpdate" method="post">
                 <div class="layui-form-item">
				    <label class="layui-form-label">用户Id：</label>
				    <div class="layui-input-block">
				      <input type="text" name="id"   autocomplete="off" class="layui-input layui-disabled"  value="${personInfo.id}">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">用户名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="name" required  lay-verify="required" autocomplete="off" class="layui-input" value="${personInfo.name }">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">密码框</label>
				    <div class="layui-input-inline">
				      <input type="text" name="password" required lay-verify="required"  autocomplete="off" class="layui-input" value="${personInfo.password }">
				   	 </div>
				   	  <div class="layui-form-mid layui-word-aux">如果不修改密码，可以不输入</div>
				  </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">级别</label>
                        <div class="layui-input-block">
						<#if personInfo.role=="1">
							<input type="text" name="role"  autocomplete="off" class="layui-input layui-disabled" value="1" >
						</#if>
						<#if personInfo.role=="2">
							<input type="text" name="role"  autocomplete="off" class="layui-input layui-disabled" value="2" >
						</#if>
						<#if personInfo.role=="3">
							<input type="text" name="role"  autocomplete="off" class="layui-input layui-disabled" value="3" >
						</#if>

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属部门</label>
                        <div class="layui-input-block">
                            <input type="text" name="dept_name"  autocomplete="off" class="layui-input layui-disabled" value="${personInfo.deptName}">
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
<script type="text/javascript" src="${base}common/layui/layui.js"></script>
<script type="text/javascript" src="${base}js/newslist.js"></script>
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