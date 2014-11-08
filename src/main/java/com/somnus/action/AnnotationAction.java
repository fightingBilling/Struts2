package com.somnus.action;

import com.opensymphony.xwork2.ActionSupport;

public class AnnotationAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	public String execute() throws Exception{
		System.out.println("*************************");
		return SUCCESS;
	}
}
