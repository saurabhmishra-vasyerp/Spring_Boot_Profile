package com.example.Student.service;

import java.util.List;

import com.example.Student.model.StudentDetail;


public interface StudentService {
	List<StudentDetail> getAllData();
	StudentDetail getStudent();
	boolean deleteStudent (Integer id);
	StudentDetail getStudentById(Integer id);
	boolean editPage(StudentDetail studentDetail);
	
}
