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
    
    <title>My JSP 'login.jsp' starting page</title>
    
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

  </head>
  
  <body>
    <form id="fm" name="fm" action="dream/register!propertyQuery.action" method="post">
    username:<input type="text" name="username"><br>
    password:<input type="password" name="password">
    age:<input type="text" name="age">
    <s:token></s:token>
    <input type="submit" value="submit">
    </form>
    
    <form  id="fm2" name="fm2" action="dream/register!modelQuery.action" method="post">
    username:<input type="text" name="user.username"><br>
    password:<input type="password" name="user.password"><br>
    age:<input type="text" name="user.age">
    <s:token></s:token>
    <input type="submit" value="submit">
    </form>
    
     <form id="fm3" name="fm3"  action="dream/register!mapQuery.action" method="post">
    username:<input type="text" name="paramMap.username"><br>
    password:<input type="password" name="paramMap.password"><br>
    age:<input type="text" name="paramMap.age">
    <s:token></s:token>
    <input type="submit" value="submit">
    </form>
  </body>
</html>
