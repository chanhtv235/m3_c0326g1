package com.example.demo_mvc.repository;

import com.example.demo_mvc.entity.Clazz;

import java.util.List;

public interface IClassRepository {
    List<Clazz> findAll();
}
