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
    <title>Struts2+jQuery+JSON 登陆验证<s:property value="email"/>|${param.email}|<s:property value="#parameters.email"/></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <style type="text/css">   
        .decorate{               /*控制文本框样式*/  
            border:1px solid #FF0000;   
            background:url(images/userVerify.gif) repeat-x;;   
            background-position:bottom;    
        }   
    </style>   
    <script type="text/javascript" src="js/jquery-1.5.2.js"></script>   
    <script type="text/javascript">   
        $(function(){   
        	$("#login :input.decorate").keyup(function(){   
            	$(this).each(function(){
	            	if($(this).val()==""){   
	                    $((this)).addClass("decorate");   
	                }else{   
	                    $((this)).removeClass("decorate");   
	                }   
            	});
            });   
            
            $("#login :submit").click(function(){   
               // 序列化表单的值
                var params = $("input").serialize();//user.username=admin&user.password=123456
				$.ajax({
					// 数据发送方式
					type: "POST",
					// 后台处理程序
					url: "<%=path%>/login.action",
					// 接受数据格式
					dataType: "JSON",
					// 要传递的数据
					data: params,
					success: function(data){
						$("div:eq(0)").remove();
						$("<div style='color:#F00; font-weight:bold;'>"+data.message+"</div>").appendTo($("body"));
					}
				});                
            });   
  
            
        });   
    </script>   
  </head>
  
  <body>
        <fieldset id="login" style="width:600px; border:1px solid #000;border-left:none;border-right:none">   
            <legend style="">用户登录</legend>   
            <p align="center">账号：<input type="text" name="user.username" id="username" class="decorate" /></p>   
            <p align="center">密码：<input type="password" name="user.password" id="password" class="decorate" /></p>   
            <p align="center"><input type="submit"  value="登录" /></p>   
        </fieldset> 
  </body>
</html>
