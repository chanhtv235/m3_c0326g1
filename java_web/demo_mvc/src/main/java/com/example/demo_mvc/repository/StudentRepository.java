package com.example.demo_mvc.repository;

import com.example.demo_mvc.dto.StudentDto;
import com.example.demo_mvc.entity.Student;
import com.example.demo_mvc.util.ConnectDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
//    private final String SELECT_AL = "select * from students;";
    private final String SELECT_ALL = "select s.*, c.name as class_name from students s join classes c on s.class_id= c.id;";
    private final String INSERT_INTO = "insert into students(name,gender,score,class_id) values(?,?,?,?);";
    private final String DELETE_BY_ID = "call delete_by_id(?);";

    @Override
    public List<StudentDto> findAll() {
        List<StudentDto> studentList = new ArrayList<>();
        // Kết nối DB
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                boolean gender = resultSet.getBoolean("gender");
                float score = resultSet.getFloat("score");
                String className = resultSet.getString("class_name");
                StudentDto student = new StudentDto(id, name, gender, score,className);
                studentList.add(student);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return studentList;
    }

    @Override
    public boolean add(Student student) {
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
        ) {
            preparedStatement.setString(1, student.getName());
            preparedStatement.setBoolean(2, student.isGender());
            preparedStatement.setFloat(3, student.getScore());
            preparedStatement.setFloat(4, student.getClassId());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("---------lỗi kết nối DB---------");
        }
        return false;
    }

    @Override
    public boolean deleteById(int id) {
        try (Connection connection = ConnectDB.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(DELETE_BY_ID);
        ) {
            callableStatement.setInt(1,id);
            int effectRow = callableStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("---------lỗi kết nối DB---------");
        }
        return false;
    }

}
