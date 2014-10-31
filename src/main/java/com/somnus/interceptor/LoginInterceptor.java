package com.somnus.interceptor;

import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.somnus.action.RegisterAction;

@SuppressWarnings("serial")
public class LoginInterceptor extends AbstractInterceptor
{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception
	{
		System.out.println("before");
		
		if(RegisterAction.class==invocation.getAction().getClass())
		{
			return invocation.invoke();
		}
		
		Map<String, Object> map = invocation.getInvocationContext().getSession();
		
		if(map.get("user")==null)
		{
			return Action.LOGIN;
		}
		
		System.out.println("after");
		
		return invocation.invoke();
	}
	

}
