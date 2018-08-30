package com.leavesystem.controller;

import com.leavesystem.data.LeaveDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="AdminLeaveUpdateController", urlPatterns={"/AdminLeaveUpdateController"})
public class AdminLeaveUpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        Integer leaveStatusId = Integer.parseInt(request.getParameter("leaveStatusId"));
        Integer leaveId = Integer.parseInt(request.getParameter("leaveId"));
        
        LeaveDao leaveDao = new LeaveDao();
        
        leaveDao.updateLeaveStatus(leaveStatusId, leaveId);
        
        request.getRequestDispatcher("AdminHomeController").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
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
