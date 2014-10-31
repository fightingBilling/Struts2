<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>百度下拉效果</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<link rel="stylesheet" type="text/css" href="css/complete.css">
<style type="text/css">
	ul,li {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	#wrapper{
		width:800px;
		height:800px;
		position:relative;
	}
	.logo{
		width:400px;
		height:129px;
		position:absolute;
		left:300px;
		top:50px;
	}
	.logo img{
		margin:0 65px 0 65px;
		cursor: pointer;
	}
	.nav{
		width:400px;
		height:30px;
		position:absolute;
		left:300px;
		top:179px;
	}
	.nav ul{
		margin:0 25px 0 25px;
	}
	.nav ul li{
		float:left;
		padding:0 7.5px 0 7.5px;
	}
	.nav ul li a{
		line-height:30px;
		font-size:15px;
		color:blue;
	}
	.ser{
		width:500px;
		height:30px;
		position:absolute;
		left:300px;
		top:209px;
	}
	.ser input[type=text]{
		border:1px solid #666;
		float:left;
		width:400px;
		height:30px;
	}
	.ser input[type=submit]{
		float:left;
		height:30px;
		margin-left:10px;
	}
	.ser #completeDiv{
	  width:398px;
	  border:1px solid #666;
	  border-top:none;
	  display:none;
	  position:absolute;
	  top:30px;
	 }
	.ser #completeDiv ul li{
		line-height:15px;
	 	padding:4px;
	 	font-size:15px;
	 	color:#000;
	 }
	.over{
	  background:#E0E0E0;
	  color:#ffffff;
	  cursor: default;
	 }
</style>
<script type="text/javascript" src="js/jquery-1.5.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			$("#wrapper div.ser :input[name=key]").keyup(function(event) 
			{ //键盘按下
					if (event.keyCode == 38) 
					{ //上e
						if (this.index == undefined || this.index <= 0) 
						{
							this.index = $("#completeDiv ul li").size() - 1;
						} 
						else
						{
							this.index--;
						}
						var li = $("#completeDiv ul li").eq(this.index);
						li.addClass("over").siblings().removeClass("over");
						$(this).first().val(li.text());
					} 
					else if (event.keyCode == 40)
					{ //下
							if (this.index == undefined || this.index >= $("#completeDiv ul li").size() - 1) 
							{
								this.index = 0;
							} 
							else 
							{
								this.index++;
							}
							var li = $("#completeDiv ul li").eq(this.index);
							li.addClass("over").siblings().removeClass("over");
							$(this).first().val(li.text());
					} 
					else if (event.keyCode == 27) 
					{ //ESC
							$('#completeDiv').hide();
					}
					else if (event.keyCode == 13)
					{ //回车
							window.location.href = "http://www.baidu.com/s?wd="+ $("div.ser :input[name=key]").val();
							this.index = undefined;
					} 
					else 
					{
							$.ajax({
									url : "baidu.action",
									type : "post",
									dataType : "json",
									data : {"text" : $("div.ser :input[name=key]").val()},
									success : function(data) 
									{
										if (data == null || data.list.length == 0) 
										{
											$("#completeDiv").hide();
											return;
										}
										$("#completeDiv").empty(); 
										var ul = $("<ul></ul>");
										$.each(data.list,function(index,item) 
										{ 
											var li = $("<li></li>").text(item).mouseover(function() 
											{
												$(this).addClass("over").siblings().removeClass("over");
												$("div.ser :input[name=key]").first().val($(this).text());
											}).click(function() 
											{
												$("div.ser :input[name=key]").first().val($(this).text());
												$("#completeDiv").hide();
											});
											ul.append(li);
										});
										$("#completeDiv").append(ul).show(); 
									}
								});
					 }
			}).blur(function(){
				$("#completeDiv").hide(); //层隐藏
			});
	});
</script>
<body>
	<div id="wrapper">
		<div class="logo"><img src="images/baidu.gif"/></div>
		<div class=nav>
			<ul>
				<li><a href="javascript:void(0)">新闻</a></li>
				<li><a href="javascript:void(0)">网页</a></li>
				<li><a href="javascript:void(0)">贴吧</a></li>
				<li><a href="javascript:void(0)">知道</a></li>
				<li><a href="javascript:void(0)">音乐</a></li>
				<li><a href="javascript:void(0)">图片</a></li>
				<li><a href="javascript:void(0)">视频</a></li>
				<li><a href="javascript:void(0)">地图</a></li>
			</ul>
		</div>
		<div class="ser">
			<input type="text" name="key"/>
			<input type="submit" name="sub"  value="百度一下">
			<div id="completeDiv"></div>
		</div>
	</div>
</body>

</html>
