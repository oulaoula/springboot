<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>服务管理分配页面</title>
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
	<script type="text/javascript">
	function doSubmit() {
		var flag = confirm("是否确认删除？");
		return flag
	}
	</script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">
				<div class="layui-inline">
					<a class="layui-btn layui-btn-normal newsAdd_btn" href="insertcustServicePre.action">添加</a>
				</div>
			</blockquote>
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                <form action="delmoreCstService.action" method="post" onsubmit="return doSubmit()">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th><input type="checkbox" id="selected-all"></th>
                                  <th>ID</th>
                                  <th>服务类型</th>
                                  <th>服务概要</th>
                                  <th>客户编号</th>
                                  <th>客户名称</th>
                                  <th>服务状态</th><!--1—创建；2—提交;3--已分配;4:已处理;5:已反馈;6:已归档  -->
                                  <th>服务请求</th>
                                  <th>创建人编号</th>
                                  <th>创建人名称</th>
                                  <th>创建日期</th>
		                               <th>分配人Id</th>
		                               <th>分配人姓名</th>
		                               <th>分配时间</th>
		                          <%-- <shiro:hasPermission name="3004">
		                               <th>服务处理</th><!--销售代表处理，记录服务结果  -->
		                               <th>处理人编号</th>
		                               <th>处理人名称</th>
		                               <th>处理人日期</th>
		                           </shiro:hasPermission>
		                           <shiro:hasPermission name="3005">
		                               <th>处理结果</th>
		                               <th>满意度</th>
		                           </shiro:hasPermission> --%>
		                         <th>操作</th>
                              </tr>
                          </thead>
                          <tbody>
                             <c:forEach items="${custService}" var="custService">
                              <tr>
                                <td><input type="checkbox" name="ids"  value="${custService.svrId}"></td>
                               	<td>${custService.svrId}</td>
                                <td>${custService.svrType}</td>
                                <td>${custService.svrTitle}</td>
                                <td>${custService.svrCustNo}</td>
                                <td>${custService.svrCustName}</td>
                                <c:choose>
                                	<c:when test="${custService.svrStatus eq '2'}">
                                		<td>已提交，待分配</td>
                                	</c:when>
                                	<c:when test="${custService.svrStatus eq '3'}">
                                		<td>已分配，待处理</td>
                                	</c:when>
                                	<c:when test="${custService.svrStatus eq '4'}">
                                		<td>已处理，待反馈</td>
                                	</c:when>
                                	<c:otherwise>
                                		<td>反馈归档</td>
                                	</c:otherwise>
                                </c:choose>
                                <td>${custService.svrRequest}</td>
                                <td>${custService.svrCreateId}</td>
                                <td>${custService.svrCreateBy}</td><!--创建人名称  -->
                                <td>
                                	<fmt:formatDate value="${custService.svrCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/><!-- 创建时间 -->
                                </td>
                                <td>${custService.svrDueId}</td>
	                            <td>${custService.svrDueTo}</td>
	                            <td>
	                            <fmt:formatDate value="${custService.svrDueDate}" pattern="yyyy-MM-dd HH:mm:ss"/><!--指派时间  -->
	                            </td>
                                 <c:choose>
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
                                <td>
                                	<a href="dogetServiceByStatusThree.action?svrId=${custService.svrId}"  class="btn btn-default" >分配</a>
                                </td>
                              </tr>
                         	 </c:forEach>
                          </tbody>
                     </table>
	                     <div class="larry-table-page clearfix">
	                          <input type="submit" class="layui-btn layui-btn-small" value="删除">
				         </div>
			        </form>
			    </div>
			    
		    </div>
		</div>
	</div>
</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
</body>
</html>