package com.leavesystem.controller;

import com.leavesystem.data.LeaveDao;
import com.leavesystem.model.Leave;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="AdminHomeController", urlPatterns={"/AdminHomeController"})
public class AdminHomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        LeaveDao leaveDao = new LeaveDao();
        List<Leave> leaveList = new ArrayList<>();
        
        leaveList = leaveDao.viewLeave();
       
        request.setAttribute("leaveListAttribute", leaveList);
        request.getRequestDispatcher("admin/").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        LeaveDao leaveDao = new LeaveDao();
        List<Leave> leaveList = new ArrayList<>();
        
        leaveList = leaveDao.viewLeave();
       
        request.setAttribute("leaveListAttribute", leaveList);
        request.getRequestDispatcher("admin/").forward(request, response);
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
