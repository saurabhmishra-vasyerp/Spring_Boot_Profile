package com.example.Student.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.Student.model.StudentDetail;

@Repository
public interface StudentRepo extends JpaRepository<StudentDetail,Integer>{

}
