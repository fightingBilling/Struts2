<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>三级联动下拉</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="<%=path%>/js/cxselect/jquery.cxselect.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#element_id').cxSelect({
		  url: '<%=path%>/js/cxselect/cityData.min.json',
		  selects: ['province', 'city', 'area']
		}); 
	});
	</script>
  </head>
  
  <body>
    <form id="region" method="post">
    	省市区:
    	<div id="element_id"> 
            <select class="province" style="width:150px;"></select>
            <select class="city" style="width:150px;"></select>
            <select class="area" style="width:150px;"></select>
        </div>
    </form>
  </body>
</html>
