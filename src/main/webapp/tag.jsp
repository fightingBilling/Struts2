<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Struts2标签</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>
<body>
	<s:set name="age" value="24"></s:set>
	<s:if test="#age>60">
    	老年人
    </s:if>
	<s:elseif test="#age>30">
    	中年人
    </s:elseif>
	<s:elseif test="#age>18">
    	青年人
    </s:elseif>
	<s:else>
    	少年
    </s:else>

	<br />

	<s:set name="list" value="{'eeeee','ddddd','ccccc','bbbbb','aaaaa'}"></s:set>
	<s:iterator value="#list" var="obj">
		<font color="red">${obj}</font>
		<font color="blue"> <s:property value="#obj" /> </font>
		<br />
	</s:iterator>

	<s:form action="register" method="post">
		<s:textfield name="username" label="用户名" maxlength="20"
			readonly="true" size="10"></s:textfield>
		<s:password name="password" label="密码" size="10"></s:password>
		<s:textarea name="personal" cols="10" rows="5" label="个人简历"
			readonly="true" warp="false"></s:textarea>

		<s:select label="最高学历" name="education1" list="{'高中','大学','硕士','博士'}" headerKey="-1" headerValue="请选择您的学历" />
		<s:select label="最高学历" name="education2" list="#{1:'高中',2:'大学',3:'硕士',4:'博士'}" headerKey="-1" headerValue="请选择您的学历" />



		<s:doubleselect label="请选择所在省市" name="province" list="{'四川省','山东省'}"
			doubleName="city"  doubleList="top == '四川省' ? {'成都市', '绵阳市'} : {'济南市', '青岛市'}" />
		

		<s:radio label="性别" name="sex1"  list="{'男','女'}" />
		<s:radio label="性别" name="sex2"  list="#{'1':'男','2':'女'}" value="1"/>
		<s:checkboxlist name="sport1" list="{'足球','篮球','排球','游泳'}" label="兴趣爱好" />
		<s:checkboxlist name="sport2" list="#{'1':'足球','2':'篮球','3':'排球','4':'游泳'}" label="兴趣爱好" />
		
		<%-- 
		<s:combobox list="{'Spring2.0宝典' , '轻量级J2EE企业应用实战' , 'JavaScript: The Definitive Guide'}" 
			label="请选择您喜欢的图书"  size="20"  name="book"  />
		--%>
		<!-- 使用简单集合来生成可上下移动选项的下拉选择框 -->
		<s:updownselect name="a" label="您喜欢的图书" 
			moveUpLabel="向上移动" moveDownLabel="向下移动"  selectAllLabel="全部选择" 
			list="{'Spring2.0宝典' , '轻量级J2EE企业应用实战' , 'JavaScript: The Definitive Guide'}" />


		<s:optiontransferselect label="最喜爱的图书" name="book1" leftTitle="Java图书"
			rightTitle="C/C++图书"
			list="{'《Java Web开发详解》', '《Struts 2深入详解》', '《Java快速入门》'}"
			headerKey="-1" headerValue="--- 请选择 ---" emptyOption="true"
			doubleName="book2"
			doubleList="{'《VC++深入详解》', '《C++ Primer》', '《C++程序设计语言》'}"
			doubleHeaderKey="-1" doubleHeaderValue="--- 请选择 ---"
			doubleEmptyOption="true" addToLeftLabel="向左移动" addToRightLabel="向右移动"
			addAllToLeftLabel="全部左移" addAllToRightLabel="全部右移"
			selectAllLabel="全部选择" leftUpLabel="向上移动" leftDownLabel="向下移动"
			rightUpLabel="向上移动" rightDownLabel="向下移动" />

		<s:submit type="image" method="login" src="images/login.jpg"></s:submit>
		<s:reset type="button" label="重置"></s:reset>
	</s:form>

</body>
</html>