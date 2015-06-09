<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	 	input[type="text"]
		{
		  width:150px;
		  margin-bottom:10px;
		  background-color:#F0F8FF;
		  font-family: Verdana, Arial;
		}
		input[type="password"]
		{
		  width:150px;
		  margin-bottom:10px;
		  background-color:#F0F8FF;
		  font-family: Verdana, Arial;
		}
	</style>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.5.2.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		jQuery.fn.extend({
			//阻止输入非数字 
	        preventNumeric:function(){
	            return $(this).keydown(function(event){
	                var keyCode = event.which;  
	                if (keyCode == 8 || keyCode == 9 || keyCode == 46 || (keyCode >= 48 && keyCode <=57))  
	                return true;  
	                else  
	                return false;  
	            }).focus(function(){
	                this.style.imeMode='disabled'; 
	            });
	        }
		});
		$(":text[name=age]").preventNumeric();
		$(":text[name='user.age']").preventNumeric();
		$(":text[name='paramMap.age']").preventNumeric();
	});
	</script>

  </head>
  
  <body>
  	<%=path %>||<%=basePath %>
    <form id="fm" name="fm" action="<%=path %>/dream/register!propertyQuery.action" method="post">
        username:<input type="text" name="username">
        password:<input type="password" name="password">
        age:<input type="text" name="age">
        <s:token></s:token>
        <input type="submit" value="submit">
    </form>
    
    <form  id="fm2" name="fm2" action="<%=path %>/dream/register!modelQuery.action" method="post">
        username:<input type="text" name="user.username">
        password:<input type="password" name="user.password">
        age:<input type="text" name="user.age">
        <s:token></s:token>
        <input type="submit" value="submit">
    </form>
    
     <form id="fm3" name="fm3"  action="<%=path %>/dream/register!mapQuery.action" method="post">
        username:<input type="text" name="paramMap.username">
        password:<input type="password" name="paramMap.password">
        age:<input type="text" name="paramMap.age">
        <s:token></s:token>
        <input type="submit" value="submit">
    </form>
  </body>
</html>
