package com.somnus.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("struts2-common")
@Namespace("/dream")
@Action(
		value="dispatcher",
		results = {@Result(name = "success", location = "/login.jsp")}
)
public class ResultTypeDispatcherAction extends ActionSupport
{
	/*
	 * 相当于request.getRequestDispatcher("path").forward(request, response)还是当前地址
	 */
	private String email;
	
	public String execute()
	{
		System.out.println("这是Dispatcher中的值"+email);
		return SUCCESS;
	}
	
	public String getEmail()
	{
		return email;
	}


	public void setEmail(String email)
	{
		this.email = email;
	}
	
}
