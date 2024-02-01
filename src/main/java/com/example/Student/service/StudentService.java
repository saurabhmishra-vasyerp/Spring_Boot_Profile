package com.example.Student.service;

import java.util.List;

import com.example.Student.dto.StudentDto;
import com.example.Student.model.StudentDetail;


public interface StudentService {
	List<StudentDto> getData();
	List<StudentDetail> getAllData();
	StudentDetail getStudent();
	boolean deleteStudent (Integer id);
	StudentDetail getStudentById(Integer id);
	boolean editPage(StudentDetail studentDetail);
	void updateStudent(int id, StudentDetail updatedStudent);
	void saveStudent(StudentDetail studentDetail);
}
