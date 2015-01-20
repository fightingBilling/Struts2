<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>加法json</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">   
        #plus input{
			border: 1px solid #808080
		}
    </style>  
	<link rel="stylesheet" type="text/css" href="css/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css">
	<script type="text/javascript" src="js/jquery-1.5.2.js"></script>   
    <script type="text/javascript" src="js/jquery.easyui.min.js" ></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js" ></script>   
	<script type="text/javascript">
	$(function()
	{
		$("#button1").click(function()
		{
				$.ajax({
					type: "POST",
					url: "<%=path%>/plus.action",
					dataType: "json",
					data: {'param1':$("#param1").val(), 'param2':$("#param2").val()},
					success: function(data){
						$("#result").val(data.tip+data.sum);
					}
				});
		});
	});
	</script>

  </head>
  
  <body>
  <form id="plus">
    <input type="text" id="param1">+
  	<input type="text" id="param2">=
    <input type="text" id="result"><input type="button" value="取值" id="button1">
  </form>
  </body>
</html>
