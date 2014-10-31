package com.somnus.action;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ResultTypeRedirectactionAction extends ActionSupport
{
	private String email;
	
	public String execute()
	{
		System.out.println("这是RedirectAction中的值"+email);
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
