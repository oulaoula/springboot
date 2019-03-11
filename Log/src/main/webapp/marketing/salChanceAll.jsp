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
            <blockquote class="layui-elem-quote news_search">
				<div class="layui-inline">
					<a class="layui-btn layui-btn-normal newsAdd_btn" href="addChance.jsp">添加</a>
				</div>
			</blockquote>
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
		         <form action="delmoreChance.action" method="post">
                <div class="layui-tab-item layui-field-box layui-show">
               	
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                              <shiro:hasRole name="r003">
                               		<th><input type="checkbox" id="selected-all"></th>
                              </shiro:hasRole>
                                  <th>ID</th>
                                  <th>机会来源</th>
                                  <th>客户名称*</th>
                                  <th>概要*</th>
                                  <th>成功几率*</th>
                                  <th>联系人</th>
                                  <th>联系电话</th>
                                  <th>机会描述</th>
                                  <th>创建人</th>
                                  <th>创建时间</th>
                                  <th>指派给→编号</th>
                                  <th>指派给→用户名</th>
                                 <%-- <c:if test="${activeUser.usrRoleId.equals('r003')}"><!-- 如果是角色3，就可以分配角色 -->
                               		<th>是否分配</th>
                                 </c:if> --%>
                                  <th>指派时间</th>
                                  <th>状态</th>
                                  <th>操作</th>
                              </tr>
                          </thead>
                          <tbody>
                             <c:forEach items="${salChance}" var="chance">
                              <tr>
                              <shiro:hasRole name="r003">
                              			  <td><input type="checkbox" name="ids"  value="${chance.chcId}"></td>
                              </shiro:hasRole>
                                <td>${chance.chcId}</td>
                                <td>${chance.chcSource}</td>
                                <td>${chance.chcCustName}</td>
                                <td>${chance.chcTitle}</td><!-- 概要 -->
                                <td>${chance.chcRate}</td>
                                <td>${chance.chcLinkman}</td>
                                <td>${chance.chcTel}</td>
                                <td>${chance.chcDesc}</td><!--机会描述  -->
                                <td>${chance.chcCreateBy}</td>
                                <td>
                               	 <fmt:formatDate value="${chance.chcCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/><!-- 创建时间 --> 
                                </td>
                                <td>${chance.chcDueId}</td><!--指派给谁 id  -->
                                <td>${chance.chcDueTo}</td>
                                <td>
                              	 <fmt:formatDate value="${chance.chcDueDate}" pattern="yyyy-MM-dd HH:mm:ss"/> 
                                </td>
                                 <c:if test="${chance.chcStatus==0}"><!--状态0未指派  -->
                                	<td><p>未指派</p> </td>
                                </c:if>
                                <c:if test="${chance.chcStatus==1}">
                                	<td>已指派</td>
                                </c:if> 
                                
                                <c:choose>
                                	<c:when test="${activeUser.usrRoleId.equals('r003')}">
                                		<td>
		                               		<div class="layui-inline">
												<a class="layui-btn layui-btn-normal newsAdd_btn" href="updateChance.action?chcId=${chance.chcId}">分配</a>
											</div>
										</td>
                                	</c:when>
                                	<c:otherwise  >
		                                <td>
			                                <div class="layui-inline">
												<a class="layui-btn layui-btn-normal newsAdd_btn" href="updateChance.action?chcId=${chance.chcId}">修改</a>
											</div>
		                                </td>
	                                </c:otherwise>
                                </c:choose>
                              </tr>
                         	 </c:forEach>
                          </tbody>
                     </table>
			         <div class="larry-table-page clearfix">
			         <shiro:hasRole name="r003">
			         			<input type="submit"   class="layui-btn layui-btn-small" value="批量删除"/>
			         </shiro:hasRole>
				          <div id="page" class="page"></div>
			         </div>
			    </div>
			   </form>
			    </div>
			    
		    </div>
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
				groups: 4 //连续显示分页数
					,
				curr:${pageInfo.pageNum}//当前页
					,
				jump: function(obj, first) {
					//得到了当前页，用于向服务端请求对应数据
					var curr = obj.curr;
					if(!first) {
						location.href = 'getAllChance.action?pageNum='+curr;
					}
				}
				});
          

    });
</script>
</body>
</html>