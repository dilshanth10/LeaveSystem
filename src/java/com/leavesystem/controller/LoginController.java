package com.leavesystem.controller;

import com.leavesystem.data.UserDao;
import com.leavesystem.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        List<User> userList = new ArrayList<>();

        UserDao userDao = new UserDao();

        userList = userDao.checkUser(username, password);

        if (!userList.isEmpty()) {
            for (User user : userList) {
                int userRoleId = user.getRoleId();

                if (userRoleId == 1) {
                    System.out.println("This is admin");
                } else if (userRoleId == 2) {
                    System.out.println("This is employee");
                }
            }
        } else {
            System.out.println("Unknown user");
        }

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
