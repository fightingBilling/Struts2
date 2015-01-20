<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>json+struts2示例</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	  .btn {
	  	float:left;
	  	margin:10px 10px;
	  }
	  #message{
	  	position: absolute;
	  	top:50px;
	  	left:20px;
	  }
	   #regForm{
	  	position: relative;
	  	top:50px;
	  	left:20px;
	  }
	</style>
	<script type="text/javascript" src="js/jquery-1.5.2.js"></script>
	<script type="text/javascript" >
	//初始加载页面时
	$(document).ready(function(){
		//为获取单个值的按钮注册鼠标单击事件
		$("#getMessage").click(function()
		{
			$.ajax({
				url:"<%=path%>/index!returnMessage.action",
				type:"POST",
				dataType:"json",
				success:function(data)
				{
					//清空显示层中的数据
					$("#message").empty();
					//通过.操作符可以从data.message中获得Action中message的值
					$("#message").append("<font color='red'>"+data.message+"</font>");
				}
			});
		}); 
		
		//为获取UserInfo对象按钮添加鼠标单击事件
		$("#getUser").click(function()
		{
			$.ajax({
				url:"<%=path%>/index!returnUser.action",
				type:"POST",
				dataType:"json",
				success:function(data)
				{
					//清空显示层中的数据
					$("#message").empty();
					//为显示层添加获取到的数据
					//获取对象的数据用data.userInfo.[属性]
					$("#message").append("<div><font color='red'>用户名："+data.user.username+"</font></div>")
							     		.append("<div><font color='red'>密码："+data.user.password+"</font></div>");
				}
			});
		});
		
		//为获取List对象按钮添加鼠标单击事件
		$("#getList").click(function()
		{
			 $.ajax({
				url:"<%=path%>/index!returnList.action",
				type:"POST",
				dataType:"json",
				success:function(data)
				{
					//清空显示层中的数据
					$("#message").empty();
					//使用jQuery中的each(data,function(){});函数
					//从data.userInfosList获取UserInfo对象放入value之中
					$.each(data.userList,function(i,value)
					{
						$("#message").append("<div>第"+(i+1)+"个用户：</div>")
							 .append("<div><font color='red'>用户ID："+value.userid+"</font></div>")
						     	.append("<div><font color='red'>用户名："+value.username+"</font></div>")
						    	 .append("<div><font color='red'>密码："+value.password+"</font></div>");
					 });
				}
			});
	 	});
	 	$("#getStrList").click(function()
		{
			 $.ajax({
				url:"<%=path%>/index!returnStrList.action",
				type:"POST",
				dataType:"json",
				success:function(data)
				{
					//清空显示层中的数据
					$("#message").empty();
					$.each(data.strList,function(i,value)
					{
						$("#message").append("<div>第"+(i+1)+"个用户：</div>")
							 .append("<div><font color='red'>用户名字："+value+"</font></div>");
					 });
				}
			});
	 	});

		//为获取Map对象按钮添加鼠标单击事件
		$("#getMap").click(function()
		{
			$.ajax({
				url:"<%=path%>/index!returnMap.action",
				type:"POST",
				dataType:"json",
				success:function(data)
				{
					//清空显示层中的数据
					$("#message").empty();
					//使用jQuery中的each(data,function(){});函数
					//从data.userInfosMap获取Map对象放入value之中
					//key值为Map的键值
					$.each(data.userMap,function(key,value)
					{
						$("#message").append("<div><font color='red'>用户ID："+value.userid+"</font></div>")
							    				.append("<div><font >用户名："+value.username+"</font></div>")
							    				 .append("<div><font color='red'>密码："+value.password+"</font></div>");
					});
				}
			});
		 });
		 $("#getStrMap").click(function()
		{
			$.ajax({
				url:"<%=path%>/index!returnStrMap.action",
				type:"POST",
				dataType:"json",
				success:function(data)
				{
					//清空显示层中的数据
					$("#message").empty();
					$.each(data.strMap,function(key,value)
					{
						$("#message").append("<div><font >用户ID："+key+"</font></div>")
							    				.append("<div><font color='red'>用户名："+value+"</font></div>");
					});
				}
			});
		 });
	});
	</script>
  </head>
  
  <body>
    <input id="getMessage"  class="btn"  type="button" value="获取单个值"/>
    <input id="getUser" class="btn"   type="button" value="获取User对象"/>
    <input id="getList"  class="btn"  type="button" value="获取List中的User对象"/>
    <input id="getMap" class="btn"   type="button" value="获取Map中的User对象"/>
    <input id="getStrList"  class="btn"  type="button" value="获取List中的String值"/>
    <input id="getStrMap" class="btn"   type="button" value="获取Map中的String值"/>
    
    <!-- 要显示信息的层 -->
    <div id="message"></div>
  </body>
</html>
