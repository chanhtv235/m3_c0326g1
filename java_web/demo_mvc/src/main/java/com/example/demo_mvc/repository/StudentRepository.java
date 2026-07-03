package com.example.demo_mvc.repository;

import com.example.demo_mvc.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static List<Student> studentList = new ArrayList<>();

    static {
        studentList.add(new Student(1, "chánh", false, 3.0f));
        studentList.add(new Student(2, "tuấn", true, 7.0f));
        studentList.add(new Student(3, "đức", true, 8.0f));
        studentList.add(new Student(4, "hải", true, 5.0f));
    }

    @Override
    public List<Student> findAll() {
        // Kết nối DB
        return studentList;
    }

    @Override
    public boolean add(Student student) {
        studentList.add(student);
        return true;
    }

}
