<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="basePath">
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
		<form action="RoleManagementLike.action" method="post">
		    <div class="layui-input-inline">
		    	<input value="" placeholder="请输入关键字" class="layui-input search_input" type="text" name="userName">
		    </div>
		    <input  type="submit" class="layui-btn search_btn" value="查询"/>
		    </form>
		</div><div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn" href="RoleManageAdd.action">添加</a>
		</div>
	</blockquote>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                <form action="delmore.action" method="post"
			onsubmit="return doSubmit()">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th><input type="checkbox" id="selected-all"></th>
                                  <th>ID</th>
                                  <th>用户名</th>
                                  <th>密码</th>
                                  <th>权限ID</th>
                                  <th>用户状态</th>
                                  <th>操作</th>
                              </tr>
                          </thead>
                          <tbody>
                           <c:forEach items="${pageInfo.list}" var="users">
                              <tr>
                                <td><input type="checkbox"  name="ids" value="${users.usrId}"></td>
                                <td>${users.usrId}</td>
                                <td>${users.usrName}</td>
                                <td>${users.usrPassword}</td>
                                <td>${users.usrRoleId}</td>
                                <td>${users.usrFlag}</td>
                                <td><a class="layui-btn layui-btn-danger batchDel" href="RoleManageUpdate.action?usrId=${users.usrId }">修改</a></td>
                              </tr>
                                </c:forEach>
                            
                          </tbody>
                     </table>
                  
                     <div class="larry-table-page clearfix">
                     <input type="submit"   class="layui-btn layui-btn-small" value="批量删除"/>
                         <!--  <a href="javascript:;" class="layui-btn layui-btn-small"><i class="iconfont icon-shanchu1"></i>删除</a> -->
				          <div id="page" class="page"></div>
			         </div>
			            </form>
			    </div>
		    </div>
		</div>
	</div>
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),
              laypage = layui.laypage;

            
          laypage({
					cont: 'page',
					pages: ${pageInfo.pages} ,//总页数
					groups: 3 ,//连续显示分页数
					curr:${pageInfo.pageNum},
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						if(!first) {
							//layer.msg('第 '+ obj.curr +' 页');
							var curr=obj.curr;
							location.href="RoleManagement.action?pageNumber="+curr;
						}
					}
				});

       /*    laypage({
					cont: 'page2',
					pages: ${pageInfo.pages} //总页数
						,
					groups: 2 //连续显示分页数
						,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							//layer.msg('第 '+ obj.curr +' 页');
							
						}
					}
				}); */
    });
</script>
</body>
</html>