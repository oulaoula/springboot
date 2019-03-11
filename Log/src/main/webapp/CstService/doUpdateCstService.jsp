<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>服务提交修改页面</title>
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
						<input type="hidden" name="svrId" value="${updateCstService.svrId}">
						  <div class="layui-form-item">
						    <label class="layui-form-label">ID：</label>
						     <div class="layui-input-inline">
						   		 <input type="text" name="svrId" readonly="readonly" required lay-verify="required"  autocomplete="off" class="layui-input" value="${updateCstService.svrId}">
						 	 </div>
							</div>
						 <div class="layui-form-item">
						    <label class="layui-form-label">服务类型：</label>
						    <div class="layui-input-inline">
						      <input type="text" name="svrType" required lay-verify="required"  autocomplete="off" class="layui-input" value="${updateCstService.svrType}">
						   	 </div>
						  </div>  
						  <div class="layui-form-item">
						    <label class="layui-form-label">服务概要:</label>
						    <div class="layui-input-inline">
						      <input type="text" name="svrTitle" required lay-verify="required"  autocomplete="off" class="layui-input" value="${updateCstService.svrTitle}">
						   	 </div>
						  </div>
						   <div class="layui-form-item">
						    <label class="layui-form-label">客户编号:</label>
						    <div class="layui-input-inline">
						      <input type="text" name="svrCustNo" required lay-verify="required"  autocomplete="off" class="layui-input" value="${updateCstService.svrCustNo}">
						   	 </div>
						  </div>
						  <div class="layui-form-item">
						    <label class="layui-form-label">客户名称：</label>
						    <div class="layui-input-inline">
						      <select name="svrCustName" lay-filter="aihao">
							      <c:forEach items="${cstCustomer}" var="cstCustomer">
							      	<c:choose>
							      		<c:when test="${updateCstService.svrCustName eq cstCustomer.custName}">
							      			<option value="${cstCustomer.custName}" selected="selected">${updateCstService.svrCustName}</option>
							      		</c:when>
							      		<c:otherwise>
							      			<option value="${cstCustomer.custName}" >${cstCustomer.custName}</option>
							      		</c:otherwise>
							      	</c:choose>
							      </c:forEach>
						      </select>
						    </div>
						  </div>
						  <div class="layui-form-item">
						    <label class="layui-form-label">服务请求:</label>
						    <div class="layui-input-inline">
						      <input type="text" name="svrRequest" required lay-verify="required"  autocomplete="off" class="layui-input" value="${updateCstService.svrRequest}">
						   	 </div>
						  </div>
						   <div class="layui-form-item">
						    <label class="layui-form-label">创建人编号:</label>
						    <div class="layui-input-inline">
						      <input type="text" name="svrCreateId" required lay-verify="required"  autocomplete="off" class="layui-input" value="${updateCstService.svrCreateId}">
						   	 </div>
						  </div>
						  <div class="layui-form-item">
						    <label class="layui-form-label">创建人名称:</label>
						    <div class="layui-input-inline">
						      <input type="text" name="svrCreateBy" required lay-verify="required"  autocomplete="off" class="layui-input" value="${updateCstService.svrCreateBy}">
						   	 </div>
						  </div>
						   <c:choose>
                                  	<c:when test="${custService.svrStatus eq '2'}"><!--如果状态是已提交，就出现分配  -->
	                                  <shiro:hasPermission name="3003"><!--如果有3003分配权限，就可以分配销售代表  -->
	                               	   <td>${custService.svrDueId}</td>
	                               	   <td>${custService.svrDueTo}</td>
	                               	    <div class="layui-form-item">
										    <label class="layui-form-label">分配给:</label>
										   <div class="layui-input-block">
										    	<c:forEach items="${userByRoleId}" var="userByRoleId">
										    		<input type="radio" name="svrDueTo" required lay-verify="required"  autocomplete="off" class="layui-input" value="${userByRoleId.usrName}" title="${userByRoleId.usrName}">
												</c:forEach>
										   </div>
										</div>
	                               	   <td>
	                               	   	 <fmt:formatDate value="${custService.svrDueDate}" pattern="yyyy-MM-dd HH:mm:ss"/><!--指派时间  -->
	                               	   </td>
	                                  </shiro:hasPermission>
	                                </c:when>
	                                <c:when test="${custService.svrStatus eq '3'}"><!--如果状态是已分配，就出现服务处理  -->
	                                  <td>${custService.svrDeal}</td><!--销售代表处理，记录服务结果  --><!--服务处理方式  -->
	                                  <td>${custService.svrDealId}</td><!--处理人编号，处理人应该和分配的销售代表是一个人  -->
	                                  <td>${custService.svrDealBy}</td>
	                                  <td>
	                                  	<fmt:formatDate value="${custService.svrDealDate}" pattern="yyyy-MM-dd HH:mm:ss"/><!--处理时间  -->
									  </td>
	                                </c:when>
	                                <c:when test="${custService.svrStatus eq '4'}"><!--如果状态是已处理 ，就显示反馈， -->
	                                  <td>${custService.svrResult}</td>
	                                  <td>${custService.svrSatisfy}</td><!--满意度  -->
	                               	</c:when>
                                  </c:choose>
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