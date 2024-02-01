package com.example.Student.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Student.dto.StudentDto;
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
	public List<StudentDto> getData() {
		List<StudentDetail> studentDetails = studentRepo.findAll();
		List<StudentDto> studentDtos = new ArrayList<StudentDto>();
		for (StudentDetail s : studentDetails) {
			StudentDto studentDto = new StudentDto();
			studentDto.setId(s.getId());
			studentDto.setName(s.getName());
			studentDto.setEmail(s.getEmail());
			studentDtos.add(studentDto);

		}
		return studentDtos;
	}

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
		System.err.println("helloo");
		StudentDetail edDetail = studentRepo.save(studentDetail);
		if (studentRepo.findById(edDetail.getId()) != null) {
			return true;
		}
		return false;
	}

	@Override
	public void updateStudent(int id, StudentDetail updatedStudent) {
		// Implementation for updating student
		StudentDetail existingStudent = studentRepo.findById(id).orElse(null);

		if (updatedStudent.getName() != null) {
			existingStudent.setName(updatedStudent.getName());
		}
		if (updatedStudent.getEmail() != null) {
			existingStudent.setEmail(updatedStudent.getEmail());
		}
		if (updatedStudent.getAddress() != null) {
			existingStudent.setAddress(updatedStudent.getAddress());
		}
		if (updatedStudent.getGender() != null) {
			existingStudent.setGender(updatedStudent.getGender());
		}
		if (updatedStudent.getPhone() != null) {
			existingStudent.setPhone(updatedStudent.getPhone());
		}

		studentRepo.save(existingStudent);

//	        else {
//	            throw new EntityNotFoundException("Student with ID " + updatedStudent.getId() + " not found");
//	        }
	}

	@Override
	public void saveStudent(StudentDetail studentDetail) {
		// Implementation for saving a student
		studentRepo.save(studentDetail);
	}

}
