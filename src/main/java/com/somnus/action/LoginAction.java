package com.somnus.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;
import com.somnus.model.User;

@ParentPackage("json-default")
@Namespace("/")
@Action(results = {@Result(name = "user", type = "json",params={"excludeProperties","user"})})
public class LoginAction extends ActionSupport
{

	private User user;
	private String message;

	public String execute() throws Exception
	{
		System.out.println("账户：" + user.getUsername());
		System.out.println("密码：" + user.getPassword());
		if (user.getUsername().equals("admin")
				&& user.getPassword().equals("admin"))
		{
			this.message = "用户名：" + user.getUsername();
		}
		else
		{
			this.message = "您的账号不存在";
			
		}
		return "user";
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

}
