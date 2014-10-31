<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'resultType.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <a href="dream/dispatcher.action?email=monday@163.com">dispatcher</a>相当于request.getRequestDispatcher("path").forward(request, response)还是当前地址
    <br/>
    <a href="dream/redirect.action?email=tuesday@163.com">redirect</a>相当于response.sendRedirect(“path”);请求新地址  重定向到一个URL
    <br/>
    <a href="dream/chain.action?email=firday@163.com">chain</a>跳转到最终结果资源页面 但是地址栏还是当前action
    <br/>
    <a href="dream/redirectAction.action?email=sunday@163.com">redirectAction</a>跳转到最终结果资源页面 并且地址栏也是最终的资源页面地址
  </body>
</html>
