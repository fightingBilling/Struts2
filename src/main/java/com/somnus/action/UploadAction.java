package com.somnus.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;
import com.somnus.util.DateUtil;

@ParentPackage("struts2-common")
@Namespace("/dream")
@Action(results = {@Result(name = "success", location = "/uploadsuc.jsp")})
public class UploadAction extends ActionSupport{
	/*
	 * 成员变量的名称不能随意更改, 
	 * private File file; 						变量的名称必须和jsp中上传文件标签中的name属性的值一致.
	 * private String fileFileName;		变量的名称必须为"上传文件的名称+FileName".
	 * private String fileContentType;	变量的名称必须为"上传文件的名称+ContentType", 
	 */
	private File file;

	private String fileFileName;

	private String fileContentType;

	public File getFile(){
		return file;
	}

	public void setFile(File file){
		this.file = file;
	}

	public String getFileFileName(){
		return fileFileName;
	}

	public void setFileFileName(String fileFileName){
		this.fileFileName = fileFileName;
	}

	public String getFileContentType(){
		return fileContentType;
	}

	public void setFileContentType(String fileContentType){
		this.fileContentType = fileContentType;
	}

	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String path = request.getSession().getServletContext().getRealPath("/upload");
		//如果上传目录不存在
        File dirFile = new File(path);
        if (!dirFile.exists()) 
        {   
            dirFile.mkdir();   
        }
		
		int idx = fileFileName.lastIndexOf(".");  
		//文件后缀  
		String extention= fileFileName.substring(idx);  
		String time = DateUtil.getCurrDate("yyyyMMddHHmmssSSS");
		//新的文件名(日期+后缀)  
		String newImgPath = time + extention; 
		request.setAttribute("newImgPath", newImgPath);
		
		//文件读入
		InputStream is = new FileInputStream(file);
		OutputStream os = new FileOutputStream(new File(path, newImgPath));
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = is.read(buffer)) != -1){
			os.write(buffer, 0, len);
		}
		is.close();
		os.close();

		return SUCCESS;
	}

}
