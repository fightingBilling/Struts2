package com.somnus.action;

import java.util.HashMap;
import java.util.Map;
import org.junit.Test;
import ognl.Ognl;
import ognl.OgnlException;
import com.opensymphony.xwork2.ognl.OgnlValueStack;
import com.opensymphony.xwork2.ognl.OgnlValueStackFactory;
import com.opensymphony.xwork2.util.CompoundRoot;
import com.opensymphony.xwork2.util.ValueStack;
import com.somnus.model.Student;
import com.somnus.model.User;

public class OgnlTest {
	@Test
	public void test1() throws OgnlException
	{
		User user = new User();
		user.setUsername("monday");
		Student student = new Student();
		student.setName("sunday");
		user.setStudent(student);
		System.out.println(Ognl.getValue("username", user));
		System.out.println(Ognl.getValue("student.name", user));
	}
	
	@Test
	public void test2() throws OgnlException
	{
		User user = new User();
		user.setUsername("monday");
		Student student = new Student();
		student.setName("sunday");
		user.setStudent(student);
		////也可以在表达式中使用#root来代表root对象
		System.out.println(Ognl.getValue("#root.username", user));
		System.out.println(Ognl.getValue("#root.student.name", user));
	}
	
	@Test
	public void test3() throws OgnlException
	{
		User user = new User();
		user.setUsername("monday");
		Student student = new Student();
		student.setName("sunday");
		user.setStudent(student);
		
		User user2 = new User();
		user2.setEmail("dreamsunday@163.com");
		
		Map<String,Object> parammap = new HashMap<String,Object>();
		parammap.put("day", "monday");
		parammap.put("num", 30);
		
		Map<String,Object> context = new HashMap<String,Object>();
	    context.put("u1", user);
	    context.put("u2", user2);
	    context.put("parammap", parammap);
	    //在表达式中需通过“#对象的名称”来访问context中的对象
	    //如果表达式中没有用到root对象，那么可以用任意一个对象代表root对象！
	    System.out.println(Ognl.getValue("#u1.username",context,new Object()));
	    System.out.println(Ognl.getValue("#u2.email",context,new Object()));
	    System.out.println(Ognl.getValue("#parammap.day",context,new Object()));
	    /*Ognl.getValue(tree, context, root)*/
	}
	
	@Test
	public void test4() throws OgnlException
	{
		User user = new User();
		user.setUsername("monday");
		Student student = new Student();
		student.setName("sunday");
		user.setStudent(student);
		
		User user2 = new User();
		user2.setEmail("dreamsunday@163.com");
		
		User user3 = new User();
		user3.setUsername("friday");
		
		Map<String,Object> parammap = new HashMap<String,Object>();
		parammap.put("day", "monday");
		parammap.put("num", 30);
		
		Map<String,Object> context = new HashMap<String,Object>();
	    context.put("u1", user);
	    context.put("u2", user2);
	    context.put("parammap", parammap);
	    //在表达式中需通过“#对象的名称”来访问context中的对象
	    //如果表达式中没有用到root对象，那么可以用任意一个对象代表root对象！
	    System.out.println(Ognl.getValue("#u1.username+'#'+username",context,user3));
	    System.out.println(Ognl.getValue("#u2.email+'#'+username",context,user3));
	    System.out.println(Ognl.getValue("#parammap.day+'#'+username",context,user3));
	    /*Ognl.getValue(tree, context, root)*/
	}
	
	/**
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */

}
