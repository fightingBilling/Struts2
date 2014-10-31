<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getXML.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.5.2.js"></script>   
	<script type="text/javascript">
		function getInfo()
		{
			$.post("getXMLAction.action",
			{
				username: $("#username").val()
			},function(returnedData,status)
			{
				var username = $(returnedData).find("username").text();
				var password = $(returnedData).find("password").text();
				var html = "<table width='60%' border='1' algin='center'> <tr><th>用户名</th><th>密码</th></tr><tr><td>"+username+"</td><td>"+password+"</td></tr></table>";
				$("#theBody table:eq(0)").remove();
				$("#theBody").append(html);
				
			});
		}
		
	</script>

  </head>
  
  <body id="theBody">
    <select id="username">
    	<option value="zhangsan">zhangsan</option>
    	<option value="lisi">lisi</option>
    </select>
    <input type="button" value="get infomation" onclick="getInfo()"/>
  </body>
</html>
