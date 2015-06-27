package com.somnus.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("struts2-common")
@Namespace("/dream")
@Action(
        value="redirect",
        results = {@Result(name = "success", location = "/index.jsp",type="redirect")}
)
public class ResultTypeRedirectAction extends ActionSupport {
    private String email;

    /*
     * 相当于response.sendRedirect(“path”);请求新地址 重定向到一个URL <!--
     * 如果是action必须加上.action 有命名空间也得加上 -->
     */

    public String execute() {
        System.out.println("这是Redirect中的值" + email);
        return SUCCESS;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
