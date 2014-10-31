package com.somnus.action;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
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
	
	@Override
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
