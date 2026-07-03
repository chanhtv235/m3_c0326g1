package com.example.demo_mvc.controller;

import com.example.demo_mvc.entity.Student;
import com.example.demo_mvc.service.IStudentService;
import com.example.demo_mvc.service.StudentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentController", value = "/student")
public class StudentController extends HttpServlet {
    private IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action ==null){
            action ="";
        }
        switch (action){
            case "add":
                showAddForm(req,resp);
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                showList(req,resp);


        }


    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("/view/student/add.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<Student> studentList = studentService.findAll();
        req.setAttribute("studentList", studentList);
        try {
            req.getRequestDispatcher("/view/student/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action ==null){
            action ="";
        }
        switch (action){
            case "add":
               save(req,resp);
                break;
            case "delete":
                break;
            case "search":
                break;
            default:


        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
      int id = Integer.parseInt(req.getParameter("id"));
      String name = req.getParameter("name");
      boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
      float score = Float.parseFloat(req.getParameter("score"));
      Student student = new Student(id,name,gender,score);
      studentService.add(student);
        try {
            resp.sendRedirect("/student?mess="+true);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
