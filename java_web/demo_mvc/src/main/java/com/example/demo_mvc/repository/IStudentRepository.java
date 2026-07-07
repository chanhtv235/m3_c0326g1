package com.example.demo_mvc.repository;

import com.example.demo_mvc.dto.StudentDto;
import com.example.demo_mvc.entity.Student;

import java.util.List;

public interface IStudentRepository {
    List<StudentDto> findAll();
    boolean add(Student student);
    boolean deleteById(int id);
}
