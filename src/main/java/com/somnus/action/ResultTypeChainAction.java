package com.somnus.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("struts2-common")
@Namespace("/dream")
@Action(
		value="chain",
		results = {
				@Result(name = "success", type="chain",params={"namespace","/dream","actionName","dispatcher","email","${email}"})
		}
)
public class ResultTypeChainAction extends ActionSupport
{
	private String email;
	
	public String execute()
	{
		System.out.println("这是Chain中的值"+email);
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
