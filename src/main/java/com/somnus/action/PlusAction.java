package com.somnus.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("json-default")
@Namespace("/")
@Action(results = {@Result(name = "plus", type = "json")})
public class PlusAction extends ActionSupport
{
	private String param1;
	private String param2;
	private int sum;
	private String tip;

	public String execute() throws Exception
	{
		int plus1 = Integer.parseInt(param1);
		int plus2 = Integer.parseInt(param2);
		sum = plus1 + plus2;
		tip = "求和为:";
		return "plus";
	}

	public String getParam1()
	{
		return param1;
	}

	public void setParam1(String param1)
	{
		this.param1 = param1;
	}

	public String getParam2()
	{
		return param2;
	}

	public void setParam2(String param2)
	{
		this.param2 = param2;
	}

	public int getSum()
	{
		return sum;
	}

	public void setSum(int sum)
	{
		this.sum = sum;
	}

	public String getTip()
	{
		return tip;
	}

	public void setTip(String tip)
	{
		this.tip = tip;
	}

}
