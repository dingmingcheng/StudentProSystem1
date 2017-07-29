package com.system.bean;

import java.io.Serializable;  
import java.sql.Date;  
import java.util.Set;

/**
 * @author dmc
 * 
 * @database Grade
 * @params username用户名 stuyear学年 stuterm学期 courname课程名 courgrade成绩 courpoint积点分
 * @time 2017-6-5 17:02
 * @version 1.0.0
 * 
 * */

public class Grade  implements Serializable{

	private String username;
	private String stuyear;
	private String stuterm;
	private String courname;
	private String courgrade;
	private String courpoint;
	
	public void setUsername(String username)
	{
		this.username=username;
	}
	public String getUsername()
	{
		return username;
	}
	
	public void setStuyear(String stuyear)
	{
		this.stuyear=stuyear;
	}
	public String getStuyear()
	{
		return stuyear;
	}
	
	public void setStuterm(String stuterm)
	{
		this.stuterm=stuterm;
	}
	public String getStuterm()
	{
		return stuterm;
	}
	
	public void setCourname(String courname)
	{
		this.courname=courname;
	}
	public String getCourname()
	{
		return courname;
	}
	
	public void setCourgrade(String courgrade)
	{
		this.courgrade=courgrade;
	}
	public String getCourgrade()
	{
		return courgrade;
	}
	
	public void setCourpoint(String courpoint)
	{
		this.courpoint=courpoint;
	}
	public String getCourpoint()
	{
		return courpoint;
	}
}
