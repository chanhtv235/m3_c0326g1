package com.example.demo_mvc.service;

import com.example.demo_mvc.dto.StudentDto;
import com.example.demo_mvc.entity.Student;
import com.example.demo_mvc.repository.IStudentRepository;
import com.example.demo_mvc.repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService{

     private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<StudentDto> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public boolean add(Student student) {
        return studentRepository.add(student);
    }

    @Override
    public boolean deleteById(int id) {
        return studentRepository.deleteById(id);
    }
}
