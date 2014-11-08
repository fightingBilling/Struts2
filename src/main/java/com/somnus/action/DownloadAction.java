package com.somnus.action;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("struts2-common")
@Namespace("/dream")
@Action(
		value="download",
		results = {
				@Result(name = "success", type="stream",
							params={"contentType","text/plain","contentDisposition","attachment;filename='${filename}'","inputName","downloadFile","bufferSize","1024"})
				}
)
public class DownloadAction extends ActionSupport
{
	private int num;
	
	private String filename;
	
	public InputStream getDownloadFile()
	{
		if(num==1)
		{
			this.filename = "baidu.gif";
			return ServletActionContext.getServletContext().getResourceAsStream("/images/baidu.gif");
		}
		else if(num==2)
		{
			this.filename = "right.png";
			return ServletActionContext.getServletContext().getResourceAsStream("/images/right.png");
		}
		else
		{
			return null;
		}
		
	}
	
	public String execute() throws Exception
	{

		return SUCCESS;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}
