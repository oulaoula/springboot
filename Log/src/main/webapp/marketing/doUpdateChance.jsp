<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>机会管理修改页面</title>
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
                <form class="layui-form" action="doUpdateChance.action" method="post">
                <input type="hidden" name="chcId" value="${chance.chcId}">
				  <div class="layui-form-item">
				    <label class="layui-form-label">机会来源：</label>
				    <div class="layui-input-inline">
				      <input type="text" name="chcSource"  required  lay-verify="required" autocomplete="off" class="layui-input" value="${chance.chcSource}">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">客户名称:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="chcCustName"  required lay-verify="required"  autocomplete="off" class="layui-input" value="${chance.chcCustName}">
				   	 </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">概要:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="chcTitle" required lay-verify="required"  autocomplete="off" class="layui-input" value="${chance.chcTitle}">
				   	 </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">成功几率:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="chcRate" required lay-verify="required"  autocomplete="off" class="layui-input" value="${chance.chcRate}">
					</div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">联系人:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="chcLinkman" required lay-verify="required"  autocomplete="off" class="layui-input" value="${chance.chcLinkman}">
					</div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">联系电话:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="chcTel" required lay-verify="required"  autocomplete="off" class="layui-input" value="${chance.chcTel}">
					</div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">机会描述:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="chcDesc" required lay-verify="required"  autocomplete="off" class="layui-input" value="${chance.chcDesc}">
					</div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">创建人:</label>
				    <div class="layui-input-inline">
				      <input type="text" name="chcCreateBy" required lay-verify="required"  autocomplete="off" class="layui-input" value="${chance.chcCreateBy}">
					</div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">创建时间:</label>
				    <div class="layui-input-inline">
				  											 															
				      <input type="text" readonly="readonly"  required lay-verify="required"  autocomplete="off" class="layui-input" value="<fmt:formatDate value="${chance.chcCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
					</div>
				  </div>
				  <c:if test="${activeUser.usrRoleId.equals('r003')}"><!-- 如果是角色3，就可以分配角色 -->
					  <div class="layui-form-item">
					    <label class="layui-form-label">指派给→用户名:</label>
					    <div class="layui-input-inline">
					      <input type="text" name="chcDueTo" required lay-verify="required"  autocomplete="off" class="layui-input" value="${chance.chcDueTo}">
						</div>
					  </div>
					</c:if>
				  <div class="layui-form-item">
				    <label class="layui-form-label">状态：</label>
				     <c:if test="${chance.chcStatus==0}"><!--状态0未指派  -->
                           <div class="layui-input-inline">
							   <input type="text"  required lay-verify="required"  autocomplete="off" class="layui-input layui-disabled" value="未指派">
							</div>
                     </c:if>
                     <c:if test="${chance.chcStatus==1}">
                           <div class="layui-input-inline">
							   <input type="text"  required lay-verify="required"  autocomplete="off" class="layui-input layui-disabled" value="已指派">
							</div>
                     </c:if>
				  </div>
				  
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