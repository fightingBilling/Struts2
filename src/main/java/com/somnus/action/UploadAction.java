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
public class UploadAction extends ActionSupport
{
	/*
	 * 成员变量的名称不能随意更改, 
	 * private File file; 						变量的名称必须和jsp中上传文件标签中的name属性的值一致.
	 * private String fileFileName;		变量的名称必须为"上传文件的名称+FileName".
	 * private String fileContentType;	变量的名称必须为"上传文件的名称+ContentType", 
	 */
	private File file;

	private String fileFileName;

	private String fileContentType;

	public File getFile()
	{
		return file;
	}

	public void setFile(File file)
	{
		this.file = file;
	}

	public String getFileFileName()
	{
		return fileFileName;
	}

	public void setFileFileName(String fileFileName)
	{
		this.fileFileName = fileFileName;
	}

	public String getFileContentType()
	{
		return fileContentType;
	}

	public void setFileContentType(String fileContentType)
	{
		this.fileContentType = fileContentType;
	}

	
	public String execute() throws Exception
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		int idx = fileFileName.lastIndexOf(".");  
		//文件后缀  
		String extention= fileFileName.substring(idx);  
		String time = DateUtil.getCurrDate("yyyyMMddHHmmssSSS");
		//新的文件名(日期+后缀)  
		String newImgPath = time + extention; 
		request.setAttribute("newImgPath", newImgPath);
		
		String root = request.getRealPath("/upload");
		//如果上传目录不存在
		File dirFile = new File(root);
		if (!dirFile.exists()) 
		{   
			dirFile.mkdir();   
		}
		//文件读入
		File destFile = new File(root, newImgPath);
		InputStream is = new FileInputStream(file);
		OutputStream os = new FileOutputStream(destFile);
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = is.read(buffer))  > 0)
		{
			os.write(buffer, 0, length);
		}
		is.close();
		os.close();

		return SUCCESS;
	}

}
