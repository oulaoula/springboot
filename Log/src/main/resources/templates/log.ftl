<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<#assign base=springMacroRequestContext.contextPath />
	<title>联系人</title>
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
		<div class="site-demo-button layui-inline" id="layerDemo" style="margin-bottom: 0;">
		<button data-method="setTop" class="layui-btn">添加</button>
		</div>
		
	</blockquote>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                     <thead>
                              <tr>
                                  <th>ID</th>
                                  <th>日志类型</th>
                                  <th>创建时间</th>
                                  <th>工作地点</th>
                                  <th>外出或出差地点</th>
                                  <th>工作内容</th>
                                  <th>日志状态</th>
                                  <th>审核状态</th>
                                  <th>员工ID</th>
                                  <th>操作</th>
                              </tr>
                              </thead>
                          <tbody>
                           <#list logList as log>
                              <tr>
                                <td>${log.log_id}</td>
                                <td>${log.log_type}</td>
                                <td>${log.log_time}</td>
                                <td>${log.workspace}</td>
                                <td>${log.workout}</td>
                                <td>${log.job_content}</td>
                                <#if log.status==1>
                                      <td>未上报</td>
                                </#if>
                                <#if log.status==2>
                                      <td>已上报</td>
                                </#if>
                                <#if log.flag==1>
                                      <td>未审核</td>
                                   </#if>
                                <#if log.flag==2>
                                      <td>已审核</td>
                                </#if>
                                <td><a class="layui-btn layui-btn-mini news_edit" href="/log/logUpdate?id=${log.id }"><i class="iconfont icon-edit"></i> 修改</a>
                                    <a class="layui-btn layui-btn-mini news_edit" href="/log/logDel?id=${log.id }"><i class="iconfont icon-edit"></i> 删除</a>
                                    <a class="layui-btn layui-btn-mini news_edit" href="/log/logReport?id=${log.id }"><i class="iconfont icon-edit"></i> 上报</a>
                                </td>
                              </tr>
                           </#list>
                            
                          </tbody>
                     </table>
                  
			    </div>
		    </div>
		</div>
	</div>
</section>
<script type="text/javascript" src="${base}common/layui/layui.js"></script>
<script type="text/javascript" src="${base}js/jquery-1.8.3.js"></script>
<script type="text/javascript">
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
				        ,content: '/log/logAdd'
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

</script>
</body>
</html>