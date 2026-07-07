package com.example.demo_mvc.repository;

import com.example.demo_mvc.dto.StudentDto;
import com.example.demo_mvc.entity.Clazz;
import com.example.demo_mvc.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassRepository implements IClassRepository {
    @Override
    public List<Clazz> findAll() {
        List<Clazz> clazzList = new ArrayList<>();
        // Kết nối DB
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from classes;");
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                clazzList.add(new Clazz(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return clazzList;
    }
}
