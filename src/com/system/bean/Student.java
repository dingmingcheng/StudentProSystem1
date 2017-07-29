package com.system.bean;

import java.io.Serializable;  
import java.sql.Date;  
import java.util.Set;

/**
 * @author dmc
 * 
 * @database Student
 * @params username用户名 stuname姓名 stunum绑定帐号 stupass绑定密码 stusch学校
 * @time 2017-6-5 17:02
 * @version 1.0.0
 * 
 * */

public class Student implements Serializable{

	private String username;
	private String stuname;
	private String stunum;
	private String stupass;
	private String stusch;
	private String stuemail;
	public String getUsername()
	{
		return username;
	}
	public String getStuname()
	{
		return stuname;
	}
	public String getStunum()
	{
		return stunum;
	}
	public String getStupass()
	{
		return stupass;
	}
	public String getStusch()
	{
		return stusch;
	}
	public String getStueamil()
	{
		return stuemail;
	}
	
	public void setUsername(String username)
	{
		this.username=username;
	}
	public void setStuname(String stuname)
	{
		this.stuname=stuname;
	}
	public void setStunum(String stunum)
	{
		this.stunum=stunum;
	}
	public void setStupass(String stupass)
	{
		this.stupass=stupass;
	}
	public void setStusch(String stusch)
	{
		this.stusch=stusch;
	}
	public void setStuemail(String stuemail)
	{
		this.stuemail=stuemail;
	}
}
