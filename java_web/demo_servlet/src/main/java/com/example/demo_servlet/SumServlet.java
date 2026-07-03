package com.example.demo_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "SumServlet" ,value = "/sum")
public class SumServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("------init-----");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/form.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int number1 = Integer.parseInt(req.getParameter("n1"));
        int number2 = Integer.parseInt(req.getParameter("n2"));
        int sum = number1+number2;
        req.setAttribute("tong", sum);
        req.getRequestDispatcher("/form.jsp").forward(req,resp);

    }

    @Override
    public void destroy() {
        System.out.println("-----------destroy------------");
    }
}
