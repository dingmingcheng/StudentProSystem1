package com.system.service;

import java.util.List;

import com.system.bean.*;

public interface StudentService {
	public boolean login(String username,String password);
	public List<Grade> StudentGrade(Grade grade);
	public boolean register(String username,String password);
	public void yonghudb(Student student,User user);
	public Timetable StudentTimetable(Timetable timetable);
}
