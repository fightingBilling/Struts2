<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'option.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript">
	$(function(){
		$.ajax({
				type: "POST",
				url: "<%=path%>/region.action",
				dataType: "json",
				data: {'provinceParam':$("#region :input:first").val()},
				success: function(data)
				{
					$.each(data.provinceMap,function(key,value)
					{
						$("#region :input:first").append("<option value="+key+">"+value+"</option>");
					});
				}
			});
		
		$("#region :input:first").change(function()
		{
			$.ajax({
				type: "POST",
				url: "<%=path%>/region.action",
				dataType: "json",
				data: {'provinceParam':$("#region :input:first").val()},
				success: function(data)
				{
					$("#region :input:eq(1)").empty().append("<option value='-1'>请选择</option>");
					$("#region :input:eq(2)").empty().append("<option value='-1'>请选择</option>");
					$.each(data.cityMap,function(key,value)
					{
						$("#region :input:eq(1)").append("<option value="+key+">"+value+"</option>");
					});
				}
			});
		});
		
		$("#region :input:eq(1)").change(function()
		{
			$.ajax({
				type: "POST",
				url: "<%=path%>/region.action",
				dataType: "json",
				data: {'cityParam':$("#region :input:eq(1)").val(),'provinceParam':$("#region :input:first").val()},
				success: function(data)
				{
					if($("#region :input:eq(2)").size()>0)
					{
						$("#region :input:eq(2)").empty();
					}
					$.each(data.districtMap,function(key,value)
					{
						$("#region :input:eq(2)").append("<option value="+key+">"+value+"</option>");
					});
				}
			});
		});
	});
	</script>
  </head>
  
  <body>
    <form id="region" method="post">
    	省市区:
    	<select name="province" id="province"  style="width:70px">
			<option value="-1">请选择</option>
		</select>
		<select name="city"  id="city"  style="width:70px">
			<option value="-1">请选择</option>
		</select>
		<select name="district" id="district"  style="width:70px">
			<option value="-1">请选择</option>
		</select>
    </form>
  </body>
</html>
