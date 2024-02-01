package com.example.Student.controller;

import java.net.Inet4Address;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.Student.dto.StudentDto;
import com.example.Student.model.StudentDetail;
import com.example.Student.service.StudentService;
@RestController()
@RequestMapping("/stuapi")
public class RequestAPIStudent {
	
	
	@Autowired
	private StudentService studentService;

//	@GetMapping({ "/", "/index" })
//	public ModelAndView index() {
//		ModelAndView modelAndView = new ModelAndView("index");
//		modelAndView.addObject("students", studentService.getData());
//		return modelAndView;
//	}

	@GetMapping(" ")
	public ResponseEntity<List<StudentDto>> index() {
		return ResponseEntity.ok(studentService.getData());
	}

	@DeleteMapping("/delete")
	public ResponseEntity<String> deleteStudent(@RequestParam Integer id) {
		studentService.deleteStudent(id);
		return ResponseEntity.ok("Suceess");
	}

	@GetMapping("/getid")
	public ResponseEntity <StudentDetail> getMethod(@RequestParam Integer id) {
		System.err.println("hello");
		return ResponseEntity.ok(studentService.getStudentById(id));

	}
	@PostMapping("/add")
	public ResponseEntity<String> addMethod(@RequestBody StudentDetail studentDetail){
		studentService.editPage(studentDetail);
		return ResponseEntity.ok("Success");
		
	}
	
	@PutMapping("/update")
	public ResponseEntity<String> updateMethod(@RequestParam int id, @RequestBody StudentDetail updatedStudent) {
	    studentService.updateStudent(id,updatedStudent);
	    return ResponseEntity.ok("Student updated successfully");
	}

}
