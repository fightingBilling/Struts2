package com.somnus.action;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;
import com.somnus.model.User;

@ParentPackage("json-default")
@Namespace("/")
@Action(
		results = {
				@Result(name = "message", type = "json"),
				@Result(name = "user", type = "json"),
				@Result(name = "list", type = "json"),
				@Result(name = "map", type = "json"),
				@Result(name = "strlist", type = "json"),
				@Result(name = "strmap", type = "json")
		}
)
public class IndexAction extends ActionSupport
{
	private String message; // 使用json返回单个值
	private User user; // 使用json返回对象
	private List<User> userList; // 使用josn返回List对象
	private Map<String, User> userMap; // 使用json返回Map对象
	private List<String> strList;
	private Map<String, String> strMap; 

	/**
	 * <p>
	 * 返回单个值
	 * <p>
	 * 
	 * @return
	 */
	public String returnMessage()
	{
		this.message = "成功返回单个值";
		return "message";
	}

	/**
	 * <p>
	 * 返回UserInfo对象
	 * </p>
	 * 
	 * @return
	 */
	public String returnUser()
	{
		user = new User();
		user.setUsername("张三");
		user.setPassword("000000");
		return "user";
	}

	/**
	 * <p>
	 * 返回List对象
	 * </p>
	 * 
	 * @return
	 */
	public String returnList()
	{
		userList = new ArrayList<User>();
		User u1 = new User();
		u1.setUserid("10001");
		u1.setUsername("张三");
		u1.setPassword("000000");
		User u2 = new User();
		u2.setUserid("10002");
		u2.setUsername("李四");
		u2.setPassword("111111");
		User u3 = new User();
		u3.setUserid("10003");
		u3.setUsername("王五");
		u3.setPassword("222222");
		User u4 = new User();
		u4.setUserid("10004");
		u4.setUsername("赵六");
		u4.setPassword("333333");
		userList.add(u1);
		userList.add(u2);
		userList.add(u3);
		userList.add(u4);
		return "list";
	}

	/**
	 * <p>
	 * 返回Map对象
	 * </p>
	 * 
	 * @return
	 */
	public String returnMap()
	{
		userMap = new LinkedHashMap<String, User>();
		User u1 = new User();
		u1.setUserid("10000");
		u1.setUsername("张三");
		u1.setPassword("000000");
		User u2 = new User();
		u2.setUserid("10001");
		u2.setUsername("李四");
		u2.setPassword("111111");
		User u3 = new User();
		u3.setUserid("10002");
		u3.setUsername("王五");
		u3.setPassword("222222");
		User u4 = new User();
		u4.setUserid("10003");
		u4.setUsername("赵六");
		u4.setPassword("333333");
		userMap.put(u1.getUserid() , u1);
		userMap.put(u2.getUserid() , u2);
		userMap.put(u3.getUserid() , u3);
		userMap.put(u4.getUserid() , u4);
		return "map";
	}
	public String returnStrList()
	{
		strList = new ArrayList<String>();
		strList.add("张三");
		strList.add("李四");
		strList.add("王五");
		strList.add("赵六");
		return "strlist";
	}
	public String returnStrMap()
	{
		strMap = new LinkedHashMap<String,String>();
		strMap.put("10000", "张三");
		strMap.put("10001", "李四");
		strMap.put("10002", "王五");
		strMap.put("10003", "赵六");
		return "strmap";
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public Map<String, User> getUserMap() {
		return userMap;
	}

	public void setUserMap(Map<String, User> userMap) {
		this.userMap = userMap;
	}

	public List<String> getStrList() {
		return strList;
	}

	public void setStrList(List<String> strList) {
		this.strList = strList;
	}

	public Map<String, String> getStrMap() {
		return strMap;
	}

	public void setStrMap(Map<String, String> strMap) {
		this.strMap = strMap;
	}

}
