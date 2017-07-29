package com.system.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.system.bean.*;
import com.system.dao.*;

@Service("StudentService")
public class StudentServiceimpl {
	@Autowired
	UserDao Mapper;
	@Autowired
	GradeDao MapperGrade;
	@Autowired
	StudentDao MapperStudent;
	@Autowired
	TimetableDao MapperTimetable;
	
	public boolean login(String username, String password)
	{
		
		User user=Mapper.selectbyname(username);
		if(user!=null)
		{
			if(user.getUsername().equals(username) && user.getPassword().equals(password))
				return true;
		}
		return false;
	}
	
	public List<Grade> StudentGrade(Grade grade)
	{
		List<Grade> grade1=new ArrayList<Grade>();
		grade1=MapperGrade.getAllGradesByUserYearTerm(grade);
		return grade1;
	}
	
	public Timetable StudentTimetable(Timetable timetable)
	{
		Timetable timetable1=new Timetable();
		timetable1=MapperTimetable.getTimetable(timetable);		
		return timetable1;
	}
	public boolean register(String username,String password)
	{
		User user=Mapper.selectbyname(username);
		if(user!=null)
		{
			return false;
		}
		return true;
	}
	public void yonghudb(Student student,User user)
	{
		Mapper.insertintoUser(user);
		MapperStudent.insertintoStudent(student);
	}
}
