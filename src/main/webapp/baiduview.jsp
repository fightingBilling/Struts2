<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
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
<link rel="stylesheet" type="text/css" href="<%=path%>/style/normalize.css">
<link href="<%=path%>/style/jquery-ui.custom.min.css" rel="stylesheet" type="text/css" >
<style type="text/css">
	#wrapper{
		width:600px;
		height:300px;
		margin:80px auto;
	}
	.logo{
		height:129px;
		padding:0 165px;
	}
	.logo img{
		cursor: pointer;
	}
	.nav{
		height:30px;
		padding:0 120px;
	}
	.nav ul{
		height:30px;
		width:360px;
		margin: 0;
        padding: 0;
        list-style: none;
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
		height:30px;
		padding:0 50px;
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
</style>
<script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.js"></script>
<script src="<%=path%>/js/jquery-ui.custom.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$(":input[name=key]").autocomplete({
            source: function(request, response){
                $.ajax({
                    type : 'post',
                    url : '<%=path%>/baidu.action',
                    dataType : 'json',
                    data : {'text':request.term},
                    success : function(data) {
                         response($.map(data.list, function(item) {
                        	 console.info(item);
                             return {
                                 label: item,
                                 value: item
                             }
                         }));
                    }
                });
            },
            /* minLength:1, */      //默认为1，触发补全列表最少输入字符数
            /* delay:0 */           //默认为300 毫秒，延迟显示设置
            /* autoFocus:true */    //设置为true 时，第一个项目会自动被选定
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
		</div>
	</div>
</body>
</html>
