package com.example.demo_mvc.repository;

import com.example.demo_mvc.entity.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
    boolean add(Student student);
}
