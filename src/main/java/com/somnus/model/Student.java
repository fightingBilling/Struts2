package com.somnus.model;

import java.util.Date;

public class Student
{
	private String name;
	private int grade;
	private Date createDate;
	public final static String TIPS = "mm";
	public Student()
	{
		
	}
	
	public Student(String name, int grade,Date createDate)
	{
		super();
		this.name = name;
		this.grade = grade;
		this.createDate = createDate;
	}

	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getGrade()
	{
		return grade;
	}
	public void setGrade(int grade)
	{
		this.grade = grade;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	

}
