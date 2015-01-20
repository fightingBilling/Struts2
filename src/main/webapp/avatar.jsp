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
    <title>富头像上传编辑</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.js"></script>
  <script type="text/javascript" src="<%=path%>/avatar/scripts/swfobject.js"></script>
  <script type="text/javascript" src="<%=path%>/avatar/scripts/fullAvatarEditor.js"></script> 
  <script type="text/javascript">
	$(function(){
		swfobject.addDomLoadEvent(function () {
			var swf = new fullAvatarEditor("<%=path%>/avatar/fullAvatarEditor.swf", "<%=path%>/avatar/expressInstall.swf", "swfContainer", {
					id : 'swf',
					upload_url :'<%=path%>/avatarServlet',
					method : 'post',	//传递到上传接口中的查询参数的提交方式。更改该值时，请注意更改上传接口中的查询参数的接收方式
					src_upload : 2,		//是否上传原图片的选项，有以下值：0-不上传；1-上传；2-显示复选框由用户选择
					avatar_box_border_width : 0,
					avatar_sizes : '100*100|50*50|32*32',
					avatar_sizes_desc : '100*100像素|50*50像素|32*32像素'
				}, function (msg) {
					switch(msg.code){
						case 1 : 
							alert("页面成功加载了组件！");
							break;
						case 2 : 
							alert("已成功加载图片到编辑面板。");
							document.getElementById("upload").style.display = "inline";
							break;
						case 3 :
							if(msg.type == 0){
								alert("摄像头已准备就绪且用户已允许使用。");
							}
							else if(msg.type == 1){
								alert("摄像头已准备就绪但用户未允许使用！");
							}
							else{
								alert("摄像头被占用！");
							}
							break;
						case 5 : 
							if(msg.type == 0){
								if(msg.content.sourceUrl){
									alert("原图已成功保存至服务器，url为：\n" + msg.content.sourceUrl+"\n\n" + "头像已成功保存至服务器，url为：\n" + msg.content.avatarUrls.join("\n\n"));
								}else{
									alert("头像已成功保存至服务器，url为：\n" + msg.content.avatarUrls.join("\n\n"));
								}
							}
							break;
						}
					}
				);
				document.getElementById("upload").onclick=function(){
					swf.call("upload");
				};
            });
    	});
    </script>   
  <body>
	<div style="width:632px;margin:0 auto;text-align:center">
		<h1 style="text-align:center">富头像上传编辑器演示</h1>
		<div>
			<p id="swfContainer">
				本组件需要安装Flash Player后才可使用，请从<a href="http://www.adobe.com/go/getflashplayer">这里</a>下载安装。
			</p>
		</div>
		<button type="button" id="upload" style="display:none;margin-top:8px;">swf外定义的上传按钮，点击可执行上传保存操作</button>
	</div>
  </body>
</html>
