package com.somnus.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("struts2-common")
@Namespace("/dream")
@Action(
        value="redirectAction",
        results = {
                @Result(name = "success",type="redirectAction",params={"namespace","/dream","actionName","redirect","email","${email}"})
        }
)
public class ResultTypeRedirectactionAction extends ActionSupport {
    private String email;

    /*
     * <!-- 只能传到下一个action中，最终页面拿不到值，因为是redirect -->
     */

    public String execute() {
        System.out.println("这是RedirectAction中的值" + email);
        return SUCCESS;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
