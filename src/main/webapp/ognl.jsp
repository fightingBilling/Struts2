<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags"%>
<%@ page import="com.somnus.model.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OGNL</title>
<style type="text/css">
table
  {
  border-collapse:collapse;
  width:50%;
  text-align:center;
  }

table, td, th
  {
  border:1px solid #6666FF;
  }
  div
  {
  	width:500px;
  	height:200px;
  	border:1px solid  black;
  	background-color: pink;
  }
font
  {
  	background-color:yellow;
  }
</style>
</head>
<body>
	<div>
		value stack contents   <font id="a">ognl【值栈】《s:property value="type"/》或$ {type}</font> <hr/>
		stack context(ActionContext) <font id="a">action上下文（栈的上下文环境）《s:property value="#type"/》或$ {type}
		These items are available using the #key notation（如果需要访问ActionContext中的key所对应的值，则需要使用#key）</font><hr/>
		<s:property value="#ActionContext"/><font id="a">访问ActionContext中的属性一定要加#，如果不加，
		固然有时候也能访问，但这种容错写法不要故意这样做</font>
	</div>
<a href="<%=path %>/dream/ognl.action?user.username=dream&email=dreamsunday@163.com&user.student.name=abc&address=london">OGNL</a><br>

       <%  
            request.setAttribute("req", "request scope");  
            request.getSession().setAttribute("sess", "session scope");  
            request.getSession().getServletContext().setAttribute("app", "aplication scope");  
        %>  
        
        
    1.通过OGNL表达式获取 属性范围中的值  
        <br/>  
        <s:property value="#request.req" />  
        <br/>  
        <s:property value="#session.sess" />  
        <br />  
        <s:property value="#application.app" />  
        <br/>  
        <hr/>  
        
        
    2.通过<span style="background-color: #fafafa;">OGNL表达式创建list 集合 ，并且遍历出集合中的值  
        <br/>  
        <s:set name="list" value="{'eeeee','ddddd','ccccc','bbbbb','aaaaa'}"></s:set>  
        <s:iterator value="#list" var="o">  
             <font color="red">${o}</font>
             <font color="blue">
             <s:property value = "#o"/>  
             </font>
            <br/>  
        </s:iterator>  
        <br/>  
        </span>
        
    3.通过OGNL表达式创建Map 集合 ，并且遍历出集合中的值  <%--  构造Map，如#{'foo1':'bar1', 'foo2':'bar2'}。--%>
        <br>  
        <s:set name="map"  value="#{'1':'eeeee','2':'ddddd','3':'ccccc','4':'bbbbb','5':'aaaaa'}"></s:set>  
        <s:iterator value="#map" var="o">  
        	<font color="red">${o.key} ${o.value}</font>
            <s:property value="#o.key"/><s:property value="#o.value"/><br/>
            <br/>  
        </s:iterator>  
        <br/>  
        <hr/>  
        
        
    4.通过OGNL表达式 进行逻辑判断  
        <br/>  
        <s:if test="'aaa' in {'aaa','bbb'}">  
            aa 在 集合{'aaa','bbb'}中；  
        </s:if>  
        <s:else>  
            aa 不在 集合{'aaa','bbb'}中；  
        </s:else>  
   
        <br/>  
   
        <s:if test="#request.req not in #list">  
            不 在 集合list中；  
        </s:if>  
        <s:else>  
            在 集合list中；  
        </s:else>  
        <br/>  
        <hr/>  
        
        
    5.通过OGNL表达式 的投影功能进行数据筛选  
        <br>  
        <s:set name="list1" value="{1,2,3,4,5}"></s:set>  
        <s:iterator value="#list1.{?#this>2}" var="o">  
            <!-- #list.{?#this>2}：在list1集合迭代的时候，从中筛选出当前迭代对象>2的集合进行显示 --> 
            ${o }<br/>  
        </s:iterator>  
        <br/>  
        <hr/>  
        
        
    5.通过OGNL表达式 访问某个类的静态方法和值  
        <br>  
        <s:property value="@java.lang.Math@floor(32.56)" />  
   
        <s:property value="@net.itcast.action.OgnlAction@get()" />  
        <br />  
        <br />  
        <hr/>  
        
        
    6.OGNL表达式 迭代标签 详细  
        <br>  
        
        <s:set name="list2" value="{'aa','bb','cc','dd','ee','ff','gg','hh','ii','jj'}"></s:set>  
        
        <table border="1">  
            <tr>  
                <td> 索引</td>  
                <td> 值   </td>  
                <td> 奇   </td>  
                <td> 偶   </td>  
                <td> 首   </td>  
                <td> 尾   </td>   
                <td> 当前迭代数量</td>  
            </tr>  
            <s:iterator value="#list2" var="o" status="s">  
                <tr bgcolor="<s:if test="#s.even">pink</s:if>">  
                    <td>  
                        <s:property value="#s.getIndex()" />  
                    </td>  
                    <td>  
                        <s:property />  
                    </td>  
                    <td>  
                        <s:if test="#s.odd">Y</s:if>  
                        <s:else>N</s:else>  
                    </td>  
                    <td>  
                        <s:if test="#s.even">Y</s:if>  
                        <s:else>N</s:else>  
                    </td>  
                    <td>  
                        <s:if test="#s.first">Y</s:if>  
                        <s:else>N</s:else>  
                    </td>  
                    <td>  
                        <s:if test="#s.isLast()">Y</s:if>  
                        <s:else>N</s:else>  
                    </td>  
                    <td>  
                    <s:property value="#s.getCount()"/>  
                </td>  
                </tr>  
   
            </s:iterator>  
        </table>  
        <br>  
        <hr/>  
        
        
    7.OGNL表达式:  if/else if/else 详细<br>  
    
        <% request.setAttribute("aa",0); %>
          
        <s:if test="#request.aa>=0 && #request.aa<=4">  
            在0-4之间；  
        </s:if>  
        <s:elseif test="#request.aa>=4 && #request.aa<=8">  
            在4-8之间；  
        </s:elseif>  
        <s:else>  
            大于8；  
        </s:else>  
        <br>  
        <hr/>  
        
    8.OGNL表达式: url 详细<br>  
        <% request.setAttribute("aa","sss"); %>  
        <s:url action="testAction" namespace="/aa/bb">  
            <s:param name="aa" value="#request.aa"></s:param>  
            <s:param name="id">100</s:param>  
        </s:url>  
        <br/>  
        <s:set name="myurl" value="'http://www.baidu.com'"></s:set>  
        value以字符处理：   <s:url value="#myurl"></s:url><br>  
        value明确指定以ognl表达式处理:    <s:url value="%{#myurl}"></s:url>  
        <br>  
        <hr/>  
        
        <s:set name="myMap" value="#{'key1':'value1','key2':'value2'}"/>
		<s:property value="#myMap['key1']"/>
		<s:url value="#myMap['key1']"/>   <%-- 输出：#myMap['key1']--%>
		<s:url value="%{#myMap['key1']}" /><%-- 输出：value1 --%>
		<%--“%”符号的用途是在标签的属性值被【理解为字符串类型】时，告诉执行环境%{}里的是OGNL表达式。 --%>
		<%--notice：struts2里不同的标签对于ognl表达式的理解是不一样的 --%>
        <s:debug></s:debug>
</body>
</html>