package com.example.Student.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Student.model.StudentDetail;
import com.example.Student.repository.StudentRepo;

@Service
public class StudentServiceimpl implements StudentService {
	@Autowired
	private StudentRepo studentRepo;

	@Override
	public List<StudentDetail> getAllData() {
		// TODO Auto-generated method stub
		List<StudentDetail> studentDetails = studentRepo.findAll();
		return studentDetails;
	}

	@Override
	public StudentDetail getStudent() {
		// TODO Auto-generated method stub
		StudentDetail studentDetail1 = new StudentDetail();
		studentDetail1.setId(1001);
		studentDetail1.setName("Saurabh Mishra");
		studentDetail1.setEmail("saurabhmishra@vasyerp.com");

		return studentDetail1;
	}

	public boolean deleteStudent(Integer id) {
		studentRepo.deleteById(id);
		if (studentRepo.findById(id) == null) {
			return true;
		}
		return false;
	}

	@Override
	public StudentDetail getStudentById(Integer id) {

		return studentRepo.findById(id).get();
	}

	@Override
	public boolean editPage(StudentDetail studentDetail) {
		// TODO Auto-generated method stub
		StudentDetail edDetail = studentRepo.save(studentDetail);
		if (getStudentById(edDetail.getId()) != null) {
			return true;
		}
		return false;
	}

}
