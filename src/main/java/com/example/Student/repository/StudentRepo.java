package com.example.Student.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Student.model.StudentDetail;



@Repository
public interface StudentRepo extends JpaRepository<StudentDetail,Integer>{

}
