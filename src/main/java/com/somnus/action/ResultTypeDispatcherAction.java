package com.somnus.action;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ResultTypeDispatcherAction extends ActionSupport
{
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
