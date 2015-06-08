package com.somnus.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;
import com.somnus.util.DateUtil;

@ParentPackage("json-default")
@Namespace("/")
@Action(results = {@Result(name = "uploadify", type = "json",params={"excludeProperties","file,fileContentType,fileFileName"})})
public class UploadifyAction extends ActionSupport{
	/*
	 * 成员变量的名称不能随意更改, 
	 * private File file; 						变量的名称必须和jsp中上传文件标签中的name属性的值一致.
	 * private String fileFileName;		变量的名称必须为"上传文件的名称+FileName".
	 * private String fileContentType;	变量的名称必须为"上传文件的名称+ContentType", 
	 */
	private List<File> file;

	private List<String> fileFileName;

	private List<String> fileContentType;
	
	private List<String> newImgPath = new ArrayList<String>();

	public String upload() throws Exception {
		for(int i=0;i<file.size();i++) {
		    HttpServletRequest request = ServletActionContext.getRequest();
		    String path = request.getSession().getServletContext().getRealPath("/upload");
		    //如果上传目录不存在
	        File dirFile = new File(path);
	        if (!dirFile.exists()) 
	        {   
	            dirFile.mkdir();   
	        }
			
			int idx = fileFileName.get(i).lastIndexOf(".");  
			//文件后缀  
			String extention= fileFileName.get(i).substring(idx);  
			String time = DateUtil.getCurrDate("yyyyMMddHHmmssSSS");
			//新的文件名(日期+后缀)  
			String newPath = time + extention; 
			
			newImgPath.add(newPath);

			File destFile = new File(path, newPath);
			
			FileUtils.copyFile(file.get(i), destFile);   
		}
		return "uploadify";
	}


	public List<File> getFile() {
		return file;
	}


	public void setFile(List<File> file) {
		this.file = file;
	}


	public List<String> getFileFileName() {
		return fileFileName;
	}


	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}


	public List<String> getFileContentType() {
		return fileContentType;
	}


	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}


	public List<String> getNewImgPath() {
		return newImgPath;
	}


	public void setNewImgPath(List<String> newImgPath) {
		this.newImgPath = newImgPath;
	}

}
