package com.example.demo_mvc.service;

import com.example.demo_mvc.dto.StudentDto;
import com.example.demo_mvc.entity.Student;

import java.util.List;

public interface IStudentService {
    List<StudentDto> findAll();
    boolean add(Student student);
    boolean deleteById(int id);
}
