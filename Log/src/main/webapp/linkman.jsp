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
	<title>联系人</title>
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
		<form action="linkmanLike.action" method="post">
		    <div class="layui-input-inline">
		    	<input value="" placeholder="请输入关键字" class="layui-input search_input" type="text" name="lkmName">
		    </div>
		    <input  type="submit" class="layui-btn search_btn" value="查询"/>
		    </form>
		</div>
		<div class="site-demo-button layui-inline" id="layerDemo" style="margin-bottom: 0;">
		<button data-method="setTop" class="layui-btn">添加</button>
		</div>
		
	</blockquote>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                <form action="delmoreLinkMan.action" method="post"
			onsubmit="return doSubmit()">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                     <thead>
                              <tr>
                                  <th><input type="checkbox"  id="all" name="all" onclick="checkAll()" ></th>
                                  <th>ID</th>
                                  <th>客户编号</th>
                                  <th>客户名称</th>
                                  <th>联系人名称</th>
                                  <th>性别</th>
                                  <th>职位</th>
                                  <th>办公室电话</th>
                                  <th>手机</th>
                                  <th>备注</th>
                                  <th>操作</th>
                              </tr>
                              </thead>
                          <tbody>
                           <c:forEach items="${pageInfo.list}" var="linkman">
                              <tr>
                                <td><input type="checkbox"  name="ids" value="${linkman.lkmId}" ></td>
                                <td>${linkman.lkmId}</td>
                                <td>${linkman.lkmCustNo}</td>
                                <td>${linkman.lkmCustName}</td>
                                <td>${linkman.lkmName}</td>
                                <td>${linkman.lkmSex}</td>
                                <td>${linkman.lkmPostion}</td>
                                <td>${linkman.lkmTel}</td>
                                <td>${linkman.lkmMobile}</td>
                                <td>${linkman.lkmMemo}</td>
                                <td><a class="layui-btn layui-btn-mini news_edit" href="linkmanUpdate.action?lkmId=${linkman.lkmId }"><i class="iconfont icon-edit"></i> 修改</a></td>
                              </tr>
                                </c:forEach>
                            
                          </tbody>
                     </table>
                  
                     <div class="larry-table-page clearfix">
                     <input type="submit"   class="layui-btn layui-btn-danger" value="批量删除"/>
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
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),
              laypage = layui.laypage;
          var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
            
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
							location.href="linkman.action?pageNumber="+curr;
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
  
		  
		  //触发事件
		  var active = {
				  setTop: function(){
				      var that = this; 
				      //多窗口模式，层叠置顶
				      layer.open({
				        type: 2 //此处以iframe举例
				        ,title: '当你选择该窗体时，即会在最顶端'
				        ,area: ['650px', '650px']
				        ,shade: 0
				        ,maxmin: true
				        ,offset:'auto'
				        ,content: 'linkmanAdd.action'
				        ,btn: ['继续弹出', '全部关闭'] //只是为了演示
				        ,btnAlign:'c'
				        ,anim:6
				        ,moveOut:true
				        ,yes: function(){
				          $(that).click(); 
				        }
				        ,btn2: function(){
				          layer.closeAll();
				        }
				        
				        ,zIndex: layer.zIndex //重点1
				        ,success: function(layero){
				          layer.setTop(layero); //重点2
				        }
				      });
				    }
				    ,offset: function(othis){
				      var type = othis.data('type')
				      ,text = othis.text();
				      
				    }
		  };
		  
		  $('#layerDemo .layui-btn').on('click', function(){
		    var othis = $(this), method = othis.data('method');
		    active[method] ? active[method].call(this, othis) : '';
		  });
		  
    });
	function checkAll(){
		var all=document.getElementById("all").checked;
		var allCheck = document.getElementsByName("ids");
		for(var i=0;i<allCheck.length;i++){
			allCheck[i].checked = all;
		}
	}
		  
</script>
</body>
</html>