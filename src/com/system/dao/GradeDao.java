package com.system.dao;

import java.util.List;

import com.system.bean.Grade;

public interface GradeDao {
	public List<Grade> getAllGrades();
	public List<Grade> getAllGradesByUserYearTerm(Grade grade);
}
