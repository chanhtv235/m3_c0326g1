package com.example.demo_mvc.service;

import com.example.demo_mvc.entity.Clazz;
import com.example.demo_mvc.repository.ClassRepository;
import com.example.demo_mvc.repository.IClassRepository;

import java.util.List;

public class ClassService implements IClassService{
    private IClassRepository classRepository = new ClassRepository();
    @Override
    public List<Clazz> findAll() {
        return classRepository.findAll();
    }
}
