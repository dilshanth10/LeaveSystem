package com.leavesystem.controller;

import com.leavesystem.data.AvailableDayDao;
import com.leavesystem.data.LeaveDao;
import com.leavesystem.model.AvailableDay;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminLeaveUpdateController", urlPatterns = {"/AdminLeaveUpdateController"})
public class AdminLeaveUpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Integer leaveStatusId = Integer.parseInt(request.getParameter("leaveStatusId"));
        Integer leaveId = Integer.parseInt(request.getParameter("leaveId"));

        LeaveDao leaveDao = new LeaveDao();

        leaveDao.updateLeaveStatus(leaveStatusId, leaveId);
        AvailableDayDao availableDao = new AvailableDayDao();

        Double remainingDays = null;
        if (leaveStatusId == 3) {
            Integer leaveTypeId = Integer.parseInt(request.getParameter("leaveTypeId"));
            Double leaveDays = Double.parseDouble(request.getParameter("leaveDays"));
            Integer userId = Integer.parseInt(request.getParameter("userId"));
            List<AvailableDay> availableDayList = availableDao.viewAvailableDaysByUserAndLeaveType(userId, leaveTypeId);

            for (AvailableDay availableDay : availableDayList) {
                float availableDayValue = availableDay.getAvailableDays();
                remainingDays = availableDayValue + leaveDays;
            }

            availableDao.updateAvailableDays(remainingDays, userId, leaveTypeId);
        }

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
