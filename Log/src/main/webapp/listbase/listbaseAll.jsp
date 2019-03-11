<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>数据字典页面</title>
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
		<form action="listbaseLike.action"  method="post">
		    <div class="layui-input-inline">
		    	<input name="dictType" value="" placeholder="请输入关键字" class="layui-input search_input" type="text">
		    </div>
		    <input type="submit" class="layui-btn search_btn" value="查询">
		  </form>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn" href="insertListBase.jsp">添加</a>
		</div>
	</blockquote>
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                <form action="delmoreBasDict.action" method="post" onsubmit="return doSubmit()">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th><input type="checkbox" id="selected-all"  lay-filter="allChoose" name="all"></th>
                                  <th>ID</th>
                                  <th>类别</th>
                                  <th>条目</th>
                                  <th>值</th>
                                  <th>是否可编辑</th>
                              </tr>
                          </thead>
                          <tbody>
                             <c:forEach items="${basDict}" var="basDict">
                              <tr>
                                <td><input type="checkbox" name="ids"  value="${basDict.dictId}"></td>
                                <td>${basDict.dictId}</td>
                                <td>${basDict.dictType}</td>
                                <td>${basDict.dictItem}</td>
                                <td>${basDict.dictValue}</td>
                                <c:if test="${basDict.dictIsEditable==0}">
                                	<td> 不可编辑</td>
                                </c:if>
                              	<c:if test="${basDict.dictIsEditable==1}">
                               		<td><a href="UpdateBasDict.action?dictId=${basDict.dictId}" class="layui-btn layui-btn-normal newsAdd_btn" >修改</a></td>
                               	</c:if>
                              </tr>
                         	 </c:forEach>
                          </tbody>
                     </table>
                     
                     <div class="larry-table-page clearfix">
                          <input type="submit" class="layui-btn layui-btn-small" value="删除">
			         	  <div id="page" class="page"></div>
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