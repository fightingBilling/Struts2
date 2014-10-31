package com.somnus;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class JqueryServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		int param1=Integer.parseInt(request.getParameter("param1"));
		int param2=Integer.parseInt(request.getParameter("param2"));
		PrintWriter out = response.getWriter();
		out.println(String.valueOf(param1+param2));
		out.flush();
	}


}
