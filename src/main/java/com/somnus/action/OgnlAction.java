package com.somnus.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.somnus.model.Student;
import com.somnus.model.User;

@ParentPackage("struts2-common")
@Namespace("/dream")
@Action(results = { @Result(name = "success", location = "/ognlsuc.jsp") })
public class OgnlAction extends ActionSupport {
    private String email;
    private User user;
    private List<String> testList = new ArrayList<String>();
    private Set<String> testSet = new HashSet<String>();
    private Map<String, String> testMap = new HashMap<String, String>();
    private List<Student> stus = new ArrayList<Student>();
    private List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();

    /*
     * private Map request;采取IOC方式用 private Map session;
     */

    public static String get() {
        return "这是LoginAction中的一个静态的方法";
    }

    public String execute() throws Exception {
        testList.add("list1");
        testList.add("list2");
        testList.add("list3");
        testList.add("list4");
        testList.add("list5");

        testSet.add("set1");
        testSet.add("set3");
        testSet.add("set2");
        testSet.add("set1");
        testSet.add("set3");

        testMap.put("m1", "map1");
        testMap.put("m2", "map2");
        testMap.put("m3", "map3");
        testMap.put("m4", "map4");
        testMap.put("m5", "map5");

        stus.add(new Student("张三", 98, new Date()));
        stus.add(new Student("李四", 43, new Date()));
        stus.add(new Student("王五", 78, new Date()));
        stus.add(new Student("马六", 85, new Date()));
        stus.add(new Student("神七", 57, new Date()));

        Map<String, Object> map1 = new HashMap<String, Object>();
        map1.put("name", "tom");
        map1.put("age", "2");
        Map<String, Object> map2 = new HashMap<String, Object>();
        map2.put("name", "jack");
        map2.put("age", "4");
        listmap.add(map1);
        listmap.add(map2);

        for (Entry<String, Object> data : ActionContext.getContext().getParameters().entrySet()) {
            String key = (String) data.getKey();
            String[] value = (String[]) data.getValue();
            for (String arr : value) {
                System.out.println(key + " : " + arr);
            }
        }
        Student student = new Student();
        student.setName("Smile");
        ActionContext.getContext().getValueStack().push(student);

        ActionContext.getContext().put("ActionContext", "ActionContext");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("day", "monday");
        paramMap.put("num", 30);
        ActionContext.getContext().put("paramMap", paramMap);

        ((Map<String, Object>) ActionContext.getContext().get("request")).put("req", "request属性范围的值");
        ActionContext.getContext().getSession().put("ses", "session属性范围的值");
        ActionContext.getContext().getApplication().put("app", "application属性范围的值");

        /*
         * HttpServletRequest request = ServletActionContext.getRequest();
         * HttpSession session = request.getSession(); ServletContext
         * applicatioon = request.getSession().getServletContext();
         * request.setAttribute("req", "request属性范围的值");
         * session.setAttribute("ses", "session属性范围的值");
         * applicatioon.setAttribute("app", "application属性范围的值");
         * request.setAttribute("aaa", "request属性范围的aaa");
         */

        return SUCCESS;

    }

    public List<String> getTestList() {
        return testList;
    }

    public void setTestList(List<String> testList) {
        this.testList = testList;
    }

    public Set<String> getTestSet() {
        return testSet;
    }

    public void setTestSet(Set<String> testSet) {
        this.testSet = testSet;
    }

    public List<Student> getStus() {
        return stus;
    }

    public void setStus(List<Student> stus) {
        this.stus = stus;
    }

    /*
     * public void setRequest(Map request) { this.request = request; }
     * 
     * public void setSession(Map session) { this.session = session; }
     */
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        user.setPassword("123456");
        this.user = user;
    }

    public Map<String, String> getTestMap() {
        return testMap;
    }

    public void setTestMap(Map<String, String> testMap) {
        this.testMap = testMap;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Map<String, Object>> getListmap() {
        return listmap;
    }

    public void setListmap(List<Map<String, Object>> listmap) {
        this.listmap = listmap;
    }

}
