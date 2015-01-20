<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.opensymphony.xwork2.ActionContext,java.util.*,com.opensymphony.xwork2.ActionInvocation,
    com.opensymphony.xwork2.util.ValueStack,com.somnus.model.*"
 %>
    <%@ taglib  prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>OGNL</title>
</head>
<style type="text/css">
	table{
	  border-collapse:collapse;
	  width:50%;
	  text-align:center;
	}
	
	table, td, th{
	  border:1px solid #6666FF;
	}
	div{
	  width:500px;
	  height:200px;
	  border:1px solid  black;
	  background-color: pink;
	}
	font{
	  background-color:yellow;
	 }
</style>
<body>
	<div>
		value stack contents   <font id="a">ognl【值栈】《s:property value="type"/》或$ {type}</font> <hr/>
		stack context(ActionContext) <font id="a">action上下文（栈的上下文环境）《s:property value="#type"/》或$ {type}
		These items are available using the #key notation（如果需要访问ActionContext中的key所对应的值，则需要使用#key）</font><hr/>
		<s:property value="#ActionContext"/><font id="a">访问ActionContext中的属性一定要加#，如果不加，
		固然有时候也能访问，但这种容错写法不要故意这样做</font>
	</div>
<h1>登录成功</h1>
<ul>
	<li><s:property value="#parameters.address"/>||<%=request.getParameter("address")%>||类似EL表达式 ||${param.address} || ${param}</li>
	 <li>【值栈】中的action普通属性：<s:property value="email"/>||<s:property value="#parameters.email"/>||${email}</li>
	 <li>【值栈】中对象的普通属性（get set 方法）:<s:property value="user.username"/>||<s:property value="user.password"/></li>
	 <li>"地址"属性获取:<s:property value="user.student.name"/></li>
	 
	 <li>调用值栈中对象的普通方法：<s:property value="user.get()"/></li>	 
	 <li>调用Action中的静态方法：<s:property value="@net.itcast.action.OgnlAction@get()"/></li>
	 
	 <li>调用JDK中的类的静态方法：<s:property value="@java.lang.Math@floor(44.56)"/></li>
	 <li>调用JDK中的类的静态方法(同上)：<s:property value="@@floor(44.56)"/></li>
	 <li>调用JDK中的类的静态方法：<s:property value="@java.util.Calendar@getInstance()"/></li>
	 <li>调用普通类中的静态属性：<s:property value="@net.itcast.model.Student@TIPS"/></li>
	 
	 <li>调用普通类的构造方法:<s:property value="new net.itcast.model.Student('王老吉').name"/></li>
	 
	 <li>获取List:<s:property value="testList"/></li>
	 <li>获取List中的某一个元素(可以使用类似于数组中的下标获取List中的内容):<s:property value="testList[0]"/></li>
	
	 <li>获取Set:<s:property value="testSet"/></li>
	 <li>获取Set中的某一个元素(Set由于没有顺序，所以不能使用下标获取数据):<s:property value="testSet[0]"/></li>
	
	 <li>获取Map:<s:property value="testMap"/></li>
	 <li>获取Map中所有的键:<s:property value="testMap.keys"/></li>
	 <li>获取Map中所有的值:<s:property value="testMap.values"/></li>
	 
	 <li>获取Map中的某一个元素(可以使用类似于数组中的下标获取List中的内容):<s:property value="testMap['m2']"/>
	 																										|<s:property value="testMap.m2"/>
	 																										|${testMap.m2}</li>
	 <li>获取List的大小:<s:property value="testSet.size"/></li>
	 
	 
	 <li>使用Lambda表达式计算阶乘:<s:property value="#f = :[#this==1?1:#this*#f(#this-1)] , #f(4)"/></li>
	 
	 
	 <li>获取List中的所有对象：<s:property value="stus"/></li>
	 <li>利用投影获取List中的对象的name属性：<s:property value="stus.{name}"/></li>
	 <li>利用投影获取List中的第一个对象的name属性：<s:property value="stus.{name}[0]"/></li>
	 
	 <li>利用选择获取List中成绩及格的对象:<s:property value="stus.{?#this.grade>=60}"/></li>
	 <li>利用选择获取List中成绩及格的对象的name:<s:property value="stus.{?#this.grade>=60}.{name}"/></li>
	 <li>利用选择获取List中成绩及格的第一个对象的name:<s:property value="stus.{?#this.grade>=60}.{name}[0]"/></li>
	 <li>利用选择获取List中成绩及格的第一个对象的name:<s:property value="stus.{^#this.grade>=60}.{name}"/></li>
	 <li>利用选择获取List中成绩及格的最后一个对象的name:<s:property value="stus.{$#this.grade>=60}.{name}"/></li>
	 <li>利用选择获取List中成绩及格的第一个对象然后求大小:<s:property value="stus.{^#this.grade>=60}.{name}.size"/></li>
	 
	 
	 <li>获取request范围中的属性：<s:property value="#request.req"/>|| ${req}</li>
	 <li>获取session范围中的属性：<s:property value="#session.ses"/>|| ${ses}</li>
	 <li>获取application范围中的属性：<s:property value="#application.app"/>|| ${app}</li>
	 <li>获取attr中的属性：<s:property value="#attr.ActionContext"/></li>
	 <li>获取put进ActionContext中的数据：<s:property value="#paramMap.day"/></li>
	 <li>获取put进ActionContext中的数据：<s:property value="#paramMap.num"/></li>
	 
	 
	  
</ul>
	<table>   
	 	<tr>
	 		<th><big>姓名</big></th>
	 		<th><big>年龄</big></th>
	 		<th><big>创建日期</big></th>
	 	</tr>
	 	<s:iterator value="stus" var="o">
	 	<tr>
	 		<td><s:property value="#o.name"/></td><!-- 遍历绝对需要加#号 不管是普通list【其中是对象也好还是map也好】 还是map -->
	 		<td><s:property value="#o.grade"/></td><!-- 遍历集合不惯是来自ognl 值栈 还是action上下文 -->
	 		<td><s:date name="#o.createDate" format="yyyy-MM-dd HH:mm:ss"/></td>
	 	</tr>
	 	</s:iterator>  
	 </table>
	 
	 <br/>
	 
	 <table>   
	 	<tr>
	 		<th><big>姓名</big></th>
	 		<th><big>年龄</big></th>
	 		<th><big>姓名</big></th>
	 		<th><big>年龄</big></th>
	 	</tr>
	 	<s:iterator value="listmap" var="o">
	 	<tr>
	 		<td><s:property value="#o.name"/></td>
	 		<td><s:property value="#o.age"/></td>
	 		
	 		<td><s:property value="name"/></td>
	 		<td><s:property value="age"/></td>
	 	</tr>
	 	</s:iterator>  
	 </table>
	 
	 <s:property value="#com.opensymphony.xwork2.ActionContext.actionInvocation"/>
	 <s:property value="#com.opensymphony.xwork2.ActionContext.application"/>
	 <s:property value="#com.opensymphony.xwork2.ActionContext.container"/>
	 <s:property value="#com.opensymphony.xwork2.ActionContext.conversionErrors"/>
	 <s:property value="#com.opensymphony.xwork2.ActionContext.locale"/>
	 <s:property value="#com.opensymphony.xwork2.ActionContext.name"/>
	 <s:property value="#com.opensymphony.xwork2.ActionContext.parameters"/>
	 <s:property value="#com.opensymphony.xwork2.ActionContext.session"/>
	 <s:property value="#com.opensymphony.xwork2.ActionContext.typeConverter"/>
	 
	 <s:property value="#com.opensymphony.xwork2.dispatcher.HttpServletResponse"/>
	 <s:property value="#com.opensymphony.xwork2.dispatcher.HttpServletRequest"/>
	  <s:property value="#com.opensymphony.xwork2.util.ValueStack.ValueStack"/>
	  <ul>
	  	<li>获取put进ActionContext中的Request数据：<%=((Map<String,Object>) ActionContext.getContext().get("request")).get("req")%></li>
	 	<li>获取put进ActionContext中的Session数据：<%=((Map<String,Object>) ActionContext.getContext().get("com.opensymphony.xwork2.ActionContext.session")).get("ses")%></li>
	 	<li>获取put进ActionContext中的Session数据：<%= ActionContext.getContext().getSession().get("ses")%></li>
		 <!-- 
			 public Map<String, Object> getSession() {
		        return (Map<String, Object>) get(SESSION);
		    }
		 -->
		<li>获取put进ActionContext中Application的数据：<%=((Map<String,Object>) ActionContext.getContext().get("com.opensymphony.xwork2.ActionContext.application")).get("app")%></li>
	 	<li>获取put进ActionContext中Application的数据：<%= ActionContext.getContext().getApplication().get("app")%></li>
	 	<!-- 
		 	public Map<String, Object> getApplication() {
	        	return (Map<String, Object>) get(APPLICATION);
	    	}
	 	 -->
	 	 <li>获取put进ActionContext中ActionInvocation的数据：<%=((ActionInvocation) ActionContext.getContext().get("com.opensymphony.xwork2.ActionContext.actionInvocation")).getAction().getClass().getName()%></li>
	 	 <li>获取put进ActionContext中ActionInvocation的数据：<%=((ActionInvocation) ActionContext.getContext().getActionInvocation()).getAction().getClass().getName()%></li>
	 	 <!-- 
	 	 	public ActionInvocation getActionInvocation() {
		        return (ActionInvocation) get(ACTION_INVOCATION);
		    }
	 	 -->
	 	 <li>获取put进ActionContext中Locale的数据：<%=((Locale) ActionContext.getContext().get("com.opensymphony.xwork2.ActionContext.locale")).getCountry()%></li>
	 	 <li>获取put进ActionContext中ActionContext的name的值：<%=((String) ActionContext.getContext().get("com.opensymphony.xwork2.ActionContext.name"))%></li>
	 	 <li>获取put进ActionContext中ActionContext的name的值：<%=((String) ActionContext.getContext().getName())%></li>
	 	 <!-- 
			 public String getName() {
			      return (String) get(ACTION_NAME);
			 }
	 	 -->
	 	 <li>获取put进ActionContext中ValueStack的数据：<%=((Student)((ValueStack) ActionContext.getContext().get("com.opensymphony.xwork2.util.ValueStack.ValueStack")).peek()).getName()%></li>
	 	 <li>获取put进ActionContext中ValueStack的数据：<%=((Student)((ValueStack) ActionContext.getContext().getValueStack()).peek()).getName()%></li>
	 	 <!-- 
		 	 public ValueStack getValueStack() {
		        return (ValueStack) get(VALUE_STACK);
		    }
	 	 -->
	 	 <li>获取put进ActionContext中Parameters的数据：<%=((String[])((Map<String, Object>) ActionContext.getContext().get("com.opensymphony.xwork2.ActionContext.parameters")).get("email"))[0]%></li>
	 	 <li>获取put进ActionContext中Parameters的数据：<%=((String[])((Map<String, Object>) ActionContext.getContext().getParameters()).get("email"))[0]%></li>
	 	 <!-- 
		 	 public Map<String, Object> getParameters() {
		        return (Map<String, Object>) get(PARAMETERS);
		    }
	 	  -->
	  </ul>
	  <s:debug></s:debug>
</body>
</html>