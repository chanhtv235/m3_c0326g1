package com.example.demo_mvc.service;

import com.example.demo_mvc.entity.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    boolean add(Student student);
}
