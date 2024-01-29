package com.example.Student.controller;

import javax.annotation.PostConstruct;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.Student.model.StudentDetail;
import com.example.Student.service.StudentService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;

	@GetMapping({"/","/index"})
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("students", studentService.getAllData());
		return modelAndView;
	}
	@GetMapping("/{id}")
	public String deleteStudent(@PathVariable Integer id) {
		studentService.deleteStudent(id);
		return "redirect:/index";
		
	}
	@GetMapping("editStudent/{id}")
	public ModelAndView editPage(@ PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("EditPage");
		modelAndView.addObject("student",studentService.getStudentById(id));
		return modelAndView;
		
	}
	@PostMapping("/EditPage")
	public String editSave(StudentDetail studentDetail) {
		if(studentService.editPage(studentDetail)) {
			return "redirect:/index";
		}
		return "EditPage";
		
	}
	
}
