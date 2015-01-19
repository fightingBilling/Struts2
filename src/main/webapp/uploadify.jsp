<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%pageContext.setAttribute("baseURL", request.getContextPath()); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>struts2 +jquey uploadify3.2 实现多文件上传，可预览、删除、排序</title>
<script src="${baseURL}/js/jquery-ui-1.10.4.custom/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="${baseURL}/js/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
<script src="${baseURL}/js/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<link   href="${baseURL}/js/uploadify/uploadify.css" rel="stylesheet" type="text/css" >
<link   href="${baseURL}/js/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery.ui.all.css"  rel="stylesheet" type="text/css" >
<style type="text/css">
	div.show{
		width:800px;
		height:250px;
		border:1px solid #666;
	}
	ul,li {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	div.show ul li{
		float:left;
		margin-left:10px;
	}
</style>  

<script type="text/javascript">  
	$(function() {
		$("#upload").button({
			icons:{
				primary: "ui-icon-play"
			}
		});
		$("#cancel").button({
			icons:{
				primary: "ui-icon-cancel"
			}
		});
		$("#uploadFile").uploadify({  
			swf: '${baseURL}/js/uploadify/uploadify.swf',  		//[必须设置]swf的路径
			uploader: '${baseURL}/uploadify!upload.action',  //[必须设置]上传文件触发的url
			width: 120,  										//设置浏览按钮的宽度 ，默认值：110
			height:25,											//设置浏览按钮的高度， 默认值：30。
			fileObjName:'file',  								//上传文件name
			auto: false,  										//设置为true当选择文件后就直接上传了，为false需要点击上传按钮才上传
			buttonText: '选择文件' ,  						//浏览按钮的文本，默认值：BROWSE 
			multi: true,  										//设置为true时可以上传多个文件
			queueID: 'some_file_queue',  				//文件队列的ID，该ID与存放文件队列的div的ID一致
			fileTypeExts:'*.jpg;*.jpge;*.gif;*.png',  	//允许上传的文件后缀  
			fileSizeLimit:'1MB',  							//上传文件的大小限制  
			queueSizeLimit: 5,  								//上传数量  
			progressData : 'all',							//队列中显示文件上传进度的方式：all-上传速度+百分比，percentage-百分比，speed-上传速度
			removeCompleted : true,					//上传成功后的文件，是否在队列中自动删除
			method:'post',									//和后台交互的方式：post/get
			onUploadSuccess: function(file, data, response){
					/* alert( 'id: ' + file.id+ ' - 索引: ' + file.index+ ' - 文件名: ' + file.name
					+ ' - 文件大小: ' + file.size+ ' - 类型: ' + file.type+ ' - 创建日期: ' + file.creationdate
					+ ' - 修改日期: ' + file.modificationdate+ ' - 文件状态: ' + file.filestatus+ ' - 服务器端消息: ' + data
					+ ' - 是否上传成功: ' + response); */
					var url = eval('(' + data + ')');  
					$("div.show ul").append("<li><img src=${baseURL}/upload/"+url.newImgPath[0]+" width='220px' height='250px' /><li>");
			},
			onFallback:function(){  
					alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");  
			},
			//当每个文件添加至队列后触发
			onSelect :function(file){	
					alert( 'id: ' + file.id+ ' - 索引: ' + file.index+ ' - 文件名: ' + file.name
						+ ' - 文件大小: ' + file.size+ ' - 类型: ' + file.type+ ' - 创建日期: ' + file.creationdate
						+ ' - 修改日期: ' + file.modificationdate+ ' - 文件状态: ' + file.filestatus);
			},
			//当队列中的所有文件全部完成上传时触发
			onQueueComplete : function(stats){
				alert( '成功上传的文件数: ' + stats.uploadsSuccessful + ' - 上传出错的文件数: ' + stats.uploadsErrored);
			},
			//当文件选定发生错误时触发
			onSelectError:function(file, errorCode, errorMsg){  
					switch(errorCode) {  
						case -100:  
							alert("上传的文件数量已经超出系统限制的"+$('#uploadFile').uploadify('settings','queueSizeLimit')+"个文件！");  
							break;  
						case -110:  
							alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#uploadFile').uploadify('settings','fileSizeLimit')+"大小！");  
							break;  
						case -120:  
							alert("文件 ["+file.name+"] 大小异常！");  
							break;  
						case -130:  
							alert("文件 ["+file.name+"] 类型不正确！");  
							break;  
					}
					/* alert( 'id: ' + file.id+ ' - 索引: ' + file.index+ ' - 文件名: ' + file.name
						+ ' - 文件大小: ' + file.size+ ' - 类型: ' + file.type+ ' - 创建日期: ' + file.creationdate
						+ ' - 修改日期: ' + file.modificationdate+ ' - 文件状态: ' + file.filestatus
						+ ' - 错误代码: ' + errorCode+ ' - 错误信息: ' + errorMsg); */
			}  
		});  
	});  
</script>  
</head>
<body>
    <div id="some_file_queue"></div>  
    <input type="file" name="file" id="uploadFile" /> 
    <div class="show">
    	<ul></ul>
    </div>
    <div style="clear:both;margin-top: 20px">
    	  <button id="upload" onclick="javascript:$('#uploadFile').uploadify('upload','*')">开始上传</button>
    	  <button id="cancel"  onclick="javascript:$('#uploadFile').uploadify('cancel','*')">取消上传</button>
    </div> 
</body>
</html>