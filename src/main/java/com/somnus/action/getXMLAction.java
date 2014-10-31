package com.somnus.action;

import org.apache.struts2.ServletActionContext;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionSupport;
import com.somnus.model.User;

@SuppressWarnings("serial")
public class getXMLAction extends ActionSupport
{
	private String username;

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	@Override
	public String execute() throws Exception
	{
		System.out.println(username + "-----------------");
		User user1 = new User();
		user1.setUsername("zhangsan");
		user1.setPassword("123456");

		User user2 = new User();
		user2.setUsername("lisi");
		user2.setPassword("123456");

		Document document = DocumentHelper.createDocument();

		Element rootElement = document.addElement("users");

		Element e = rootElement.addElement("user");

		Element e1 = e.addElement("username");

		Element e2 = e.addElement("password");

		if ("zhangsan".equals(username))
		{
			e1.setText(user1.getUsername());
			e2.setText(user1.getPassword());
		}
		else
		{
			e1.setText(user2.getUsername());
			e2.setText(user2.getPassword());
		}

		HttpServletResponse response = ServletActionContext.getResponse();
		/*HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().
		get(ServletActionContext.HTTP_RESPONSE);*/

		response.setContentType("text/xml; charset=utf-8");

		response.setHeader("cache-control", "no-cache");
		response.setHeader("pragma","no-cache");

		PrintWriter out = response.getWriter();

		OutputFormat format = OutputFormat.createPrettyPrint();

		format.setEncoding("utf-8");

		XMLWriter writer = new XMLWriter(out, format);

		writer.write(document);

		out.flush();
		out.close();

		return null;

	}

}
