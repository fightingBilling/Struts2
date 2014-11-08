package com.somnus.action;

import java.util.Map;
/*import javax.servlet.ServletContext;*/
import javax.servlet.http.HttpServletRequest;
/*import javax.servlet.http.HttpServletResponse;*/
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.somnus.exception.SystemException;
import com.somnus.model.User;

@ParentPackage("struts2-common")
@Namespace("/dream")
@Action( //表示请求的Action及处理方法   
        value="register",  //表示action的请求名称   
        results={  //表示结果跳转   
                @Result(name="propertyQuery",location="/demo/result.jsp"),  
                @Result(name="modelQuery",location="/demo/resul2t.jsp"),  
                @Result(name="mapQuery",location="/demo/result3.jsp"),
                @Result(name="invalid.token",location="/demo/invalid.jsp")  
        },  
        interceptorRefs={ //表示拦截器引用   
                @InterceptorRef("defaultStack"),  
                @InterceptorRef("token"),
                @InterceptorRef("loginInterceptor")
        },  
        exceptionMappings={  //映射映射声明   
                @ExceptionMapping(exception="com.somnus.exception.SystemException",result="resource404")  
        }  
)  
public class RegisterAction extends ActionSupport
{
	private String username;
	private String password;
	private int age;
	/*---------------------------------------------*/
	private User user;
	/*---------------------------------------------*/
	private Map<String, Object> paramMap;
	{}
	public String propertyQuery() throws Exception
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		/*HttpServletRequest request = ServletActionContext.getRequest();*/
		
		HttpSession session = request.getSession();
		/*ServletContext applicatioon = request.getSession().getServletContext();*/
		
		
		/*Map request = (Map) ActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();
		Map application = ActionContext.getContext().getApplication();*/
		
		
		/*HttpServletResponse response = ServletActionContext.getResponse();*/
		/*HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);*/
		
		if ("".equals(username) || "".equals(password))
		{
			throw new SystemException("输入不合法");
		}
		else
		{
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			
			/*session.put("user", username);*/
			session.setAttribute("user", username);
		}
		return "propertyQuery";
	}
	
	public String modelQuery() throws Exception
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		/*HttpServletRequest request = ServletActionContext.getRequest();*/
		
		HttpSession session = request.getSession();
		/*ServletContext applicatioon = request.getSession().getServletContext();*/
		
		
		/*Map request = (Map) ActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();
		Map application = ActionContext.getContext().getApplication();*/
		
		if ("".equals(username) || "".equals(password))
		{
			throw new SystemException("输入不合法");
		}
		else
		{
			/*session.put("user", username);*/
			session.setAttribute("user", username);
		}
		return "modelQuery";
	}
	
	public String mapQuery() throws Exception
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		/*HttpServletRequest request = ServletActionContext.getRequest();*/
		
		HttpSession session = request.getSession();
		/*ServletContext applicatioon = request.getSession().getServletContext();*/
		
		
		/*Map request = (Map) ActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();
		Map application = ActionContext.getContext().getApplication();*/
		
		if ("".equals(username) || "".equals(password))
		{
			throw new SystemException("输入不合法");
		}
		else
		{
			/*session.put("user", username);*/
			mapArrayToStr(paramMap);
			session.setAttribute("user", username);
		}
		return "mapQuery";
	}
	public static void mapArrayToStr(Map<String, Object> dataMap) {
		if (null != dataMap) {
			for (String st : dataMap.keySet()) {

				if (dataMap.get(st) instanceof String[]) {
					String[] array = (String[]) dataMap.get(st);
					if ("null".equals(array[0])) {
						dataMap.put(st, null);
					} else {
						dataMap.put(st, array[0]);
					}

				} else if (dataMap.get(st) instanceof String) {
					dataMap.put(st, dataMap.get(st));
				}

			}
		}
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Map<String, Object> getParamMap() {
		return paramMap;
	}

	public void setParamMap(Map<String, Object> paramMap) {
		this.paramMap = paramMap;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}
