<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>机会管理页面</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="${basePath }common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="${basePath }common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="${basePath }common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="${basePath }css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
               	<form action="doPlacingOrders.action" method="post" onsubmit="return checkSubmit()">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th>ID</th>
                                  <th>下单客户ID</th>
                                  <th>下单客户名</th>
                                  <th>客户经理名</th>
                                  <th>客户等级</th>
                                  <th>客户地址</th>
                                  <th>客户状态</th>
                                  <th>下单日期</th>
                                  <th>下单地址</th>
                                  <th>下单商品</th>
                                  <th>商品数量</th>
                                   <th>执行下单</th>
                              </tr>
                          </thead>
                          <tbody>
                             <c:forEach items="${orderList}" var="order">
                              <tr>
                                <td><input name="odrId" class="layui-input layui-disabled"   value="${order.odrId}" > </td>
                                <td>${order.odrCustName}</td>
                                <td>${order.customer.custName}</td>
                                <td>${order.customer.custManagerName}</td><!-- 经理名 -->
                                <td>${order.customer.custLevelLabel}</td>
                                <td>${order.customer.custAddr}</td>
                                <td>${order.customer.custStatus}</td>
                                <td> <fmt:formatDate value="${order.odrDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td><!--下单时间  -->
                                <td>${order.odrAddr}</td>
                                <td>
                                <select name="prodId" lay-verify="required" >
                                		<c:forEach items="${productList }" var="product">
												<option value="${product.prodId}" selected="selected">${product.prodName}</option>
                                		</c:forEach>
                                			</select> 
                                </td>
                                <td>
                                <input  type="text" id="count" name="count" lay-verify="required" placeholder="请输入商品数量" autocomplete="off" class="layui-input"/>
                                </td>
                                <td>
                                <button class="layui-btn layui-btn-primary layui-btn-sm" type="submit"><i class="layui-icon">+</i></button>
                                </td>
                                
                              </tr>
                         	 </c:forEach>
                          </tbody>
                     </table>
                     </form>
			    </div>
			    </div>
			    
		    </div>
		</div>
	</div>
</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function checkCount(){
	var value = $("#count").val();
	var reg=/^[1-9]+\d*$/;
	if(!reg.test(value)){
		$("#count").val("");
	   alert("请输入正确的商品数量!");
	}else{
		return true;
	}
}
	function checkSubmit(){
		var value = $("#count").val();
		if(checkCount() & value!=null & value!=""){
			return true;
		}else{
			return false;
		}
	}
</script>
</body>
</html>