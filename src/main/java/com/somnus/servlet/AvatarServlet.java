package com.somnus.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import com.alibaba.fastjson.JSON;
import com.somnus.model.Json;
import com.somnus.util.DateUtil;
/** 
 *  
 * @author Administrator 
 * 文件上传 
 * 具体步骤： 
 * 1）获得磁盘文件条目工厂 DiskFileItemFactory 要导包 
 * 2） 利用 request 获取 真实路径 ，供临时文件存储，和 最终文件存储 ，这两个存储位置可不同，也可相同 
 * 3）对 DiskFileItemFactory 对象设置一些 属性 
 * 4）高水平的API文件上传处理  ServletFileUpload upload = new ServletFileUpload(factory); 
 * 目的是调用 parseRequest（request）方法  获得 FileItem 集合list ， 
 *      
 * 5）在 FileItem 对象中 获取信息，   遍历， 判断 表单提交过来的信息 是否是 普通文本信息  另做处理 
 * 6） 
 *    第一种. 用第三方 提供的  item.write( new File(path,filename) );  直接写到磁盘上 
 *    第二种. 手动处理   
 * 
 */  
public class AvatarServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Json json = new Json();
		if ( request.getContentType().indexOf("multipart/form-data") >= 0 ){
			String root = request.getRealPath("/upload");
			//如果上传目录不存在,自动创建一个
			File dirFile = new File(root);
			if (!dirFile.exists()){
				dirFile.mkdir();   
			}
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			//基于原图的初始化参数
			String initParams = "" ;
			//定义一个变量用以储存当前头像的序号
			int avatarNumber = 1;
			BufferedInputStream	inputStream;
			BufferedOutputStream outputStream;
			try {
				List<FileItem> list = (List<FileItem>)upload.parseRequest(request);  
				//遍历表单域
				for(FileItem fileItem:list){
					String fieldName = fileItem.getFieldName();
					//是否是原始图片 file 域的名称（默认的 file 域的名称是__source，可在插件配置参数中自定义。参数名：src_field_name）
					Boolean isSourcePic = fieldName.equals("__source");
					//当前头像基于原图的初始化参数（只有上传原图时才会发送该数据，且发送的方式为POST），用于修改头像时保证界面的视图跟保存头像时一致，提升用户体验度。
					//修改头像时设置默认加载的原图url为当前原图url+该参数即可，可直接附加到原图url中储存，不影响图片呈现。
					if ( fieldName.equals("__initParams") ){
						inputStream = new BufferedInputStream(fileItem.getInputStream());
						byte[] bytes = new byte [inputStream.available()];
						inputStream.read(bytes); 
						initParams = new String(bytes, "UTF-8");
						inputStream.close();
					}
					//如果是原始图片 file 域的名称或者以默认的头像域名称的部分“__avatar”打头(默认的头像域名称：__avatar1,2,3...，可在插件配置参数中自定义，参数名：avatar_field_names)
					else if( isSourcePic || fieldName.startsWith("__avatar") ){
						//取服务器时间(精确到毫秒)作为部分文件名，确保文件名无重复。
						String time = DateUtil.getCurrDate("yyyyMMddHHmmssSSS");
						//上传路劲+文件名
						/*String virtualPath = "/upload/avatar" + avatarNumber + "_" + time + ".jpg";*/
						//文件名
						String filename = "avatar" + avatarNumber + "_" + time + ".jpg";
						//原始图片（默认的 file 域的名称是__source，可在插件配置参数中自定义。参数名：src_field_name）。
						if( isSourcePic ){
							//文件名，如果是本地或网络图片为原始文件名、如果是摄像头拍照则为 *FromWebcam.jpg
							String sourceFileName = fileItem.getName();	
							//原始文件的扩展名(不包含“.”)
							String sourceExtendName = sourceFileName.substring(sourceFileName.lastIndexOf('.') + 1);
							/*virtualPath = String.format("/upload/source_%s.%s", time, sourceExtendName);*/
							filename = String.format("source_%s.%s", time, sourceExtendName);
							/*json.setSourceUrl(virtualPath);*/
							json.setSourceUrl("/upload/" + filename);
						}
						//头像图片（默认的 file 域的名称：__avatar1,2,3...，可在插件配置参数中自定义，参数名：avatar_field_names）。
						else{
							/*json.getAvatarUrls().add(virtualPath);*/
							json.getAvatarUrls().add("/upload/" + filename);
							avatarNumber++;
						}
						try {
							fileItem.write( new File(request.getRealPath("/upload"),filename) );
						} catch (Exception e) {
							e.printStackTrace();
						}
						/*inputStream = new BufferedInputStream(fileItem.getInputStream());
						outputStream = new BufferedOutputStream(new FileOutputStream(request.getRealPath("/")+virtualPath));
						Streams.copy(inputStream, outputStream, true);
						inputStream.close();
				        outputStream.flush();
				        outputStream.close();*/
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (json.getSourceUrl() != null ){
				json.setSourceUrl(json.getSourceUrl()+initParams);
			}
			json.setMsg("Success");
			json.setSuccess(true);
		}
		response.getWriter().write(JSON.toJSONString(json));
	}
}
