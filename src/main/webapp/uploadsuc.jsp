<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib  prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>struts2的上传</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	window.onclick = function(){
		alert("${newImgPath}");
		alert("<s:property value='#request.newImgPath'/>");
	};
	</script>
  </head>
  
  <body>
  	<img alt="" src="<%=path%>/upload/${newImgPath}" width='220px' height='250px' >
    file:<s:property value="#request.newImgPath"/>
    fileContentType:<s:property value="fileContentType"/>
  </body>
</html>