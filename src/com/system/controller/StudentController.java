package com.system.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.system.service.*;
import com.system.bean.*;
@Controller
//@RequestMapping("/user")用于标定访问时对url位置
//在默认情况下springmvc的实例都是单例模式,�?以使用scope域将其注解为每次都创建一个新的实例
@Scope("prototype")
public class StudentController {
    @Autowired
	StudentServiceimpl studentService;
    //登录判断
    //@RequestMapping(value="/login",method=RequestMethod.POST)
    @RequestMapping("loginer.do")
    public @ResponseBody String login(User user,HttpServletRequest request, HttpServletResponse response) throws IOException{
        String s1,s2;
		s1=request.getParameter("username");
		s2=request.getParameter("password");
		user.setUsername(s1);
		user.setPassword(s2);
		HttpSession session=request.getSession();
		String mes=null;
	    boolean loginType = studentService.login(user.getUsername(),user.getPassword());
	    mes="yes";
	    String username=s1;
	    if(loginType){
            
//	         request.setAttribute("user",user);
//	         return "blank";
	    	 
	         session.setAttribute("userNow",username);	         
//	         String x="";
//	         Object obj=session.getAttribute("userNow");
//	         x=(String)obj;
//	         System.out.println(x);
	         
	         response.setContentType("text/plain;charset=UTF-8");  
	         response.getWriter().write(mes);
	         System.out.println("yes!");
	         //return "blank";
	         
	     }else{
	    	 mes="dfgdh";  
	         response.setContentType("text/plain;charset=UTF-8");  
	         response.getWriter().write(mes);
	     }
	     return null;
	}
    
    //用户注册
    @RequestMapping("registeration.do")
    public String registeration(User user,Student student,HttpServletRequest request, HttpServletResponse response) throws IOException{
    	request.setCharacterEncoding("UTF-8");
    	String username,password,stuname,stunum,stupass,stusch,stuemail;
		username=request.getParameter("username");
		password=request.getParameter("password");
		stuname=request.getParameter("stuname");
		stunum=request.getParameter("stunum");
		stupass=request.getParameter("stupass");
		stusch=URLDecoder.decode(request.getParameter("stusch"),"utf-8");
		stuemail=request.getParameter("stuemail");
    	boolean regtype=studentService.register(username, password);
    	user.setPassword(password);
    	user.setUsername(username);
    	student.setStuemail(stuemail);
    	student.setStuname(stuname);
    	student.setStunum(stunum);
    	student.setStupass(stupass);
    	student.setStusch(stusch);
    	student.setUsername(username);
    	String mes;
    	if(regtype)
    	{
    		response.setContentType("text/plain;charset=UTF-8");  
    		mes="注册成功";
    		studentService.yonghudb(student, user);
    		response.getWriter().write(mes);
    	}
    	else {
    		response.setContentType("text/plain;charset=UTF-8");
    		mes="该用户名已被注册";
    		response.getWriter().write(mes);
    	}
	    return null;
	}
     // 成绩查询
    @RequestMapping("querygrade.do")
    public String querygrade(Grade grade,User user,Student student,HttpServletRequest request, HttpServletResponse response) throws IOException
    {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String stuyear=new String();
        String stuterm=new String();
        String username=new String();
        stuyear=request.getParameter("stuyear");
        stuterm=request.getParameter("stuterm");
        username=request.getParameter("username");
        //System.out.println(username+" "+stuyear+" "+stuterm);
        String str = new String(stuyear.getBytes("ISO-8859-1"),"utf-8");
        JSONObject Json=new JSONObject();
		List<Grade> okk=new ArrayList<Grade>();
		okk=studentService.StudentGrade(grade);
		Json.put("list", okk);
		out.write(Json.toString());
    	return null;
    }
    //课程表查询
    @RequestMapping("querytimetable")
    public String querytimetable(Timetable timetable,HttpServletRequest request, HttpServletResponse response) throws IOException
    {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String stuyear=new String();
        String stuterm=new String();
        String username=new String();
        stuyear=request.getParameter("stuyear");
        stuterm=request.getParameter("stuterm");
        username=request.getParameter("username");
        timetable.setStuterm(stuterm);
        timetable.setStuyear(stuyear);
        timetable.setUsername(username);
        timetable.setTttext("1");
        Timetable ans=studentService.StudentTimetable(timetable);
        out.write(ans.getTttext().toString());
    	return null;
    }
}
