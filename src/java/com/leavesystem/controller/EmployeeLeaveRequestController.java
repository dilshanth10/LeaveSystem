package com.leavesystem.controller;

import com.leavesystem.data.LeaveDao;
import com.leavesystem.model.AvailableDay;
import com.leavesystem.model.Leave;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EmployeeLeaveRequestController", urlPatterns = {"/EmployeeLeaveRequestController"})
public class EmployeeLeaveRequestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Integer leaveTypeId = Integer.parseInt(request.getParameter("leaveType"));
            Integer remainDays = Integer.parseInt(request.getParameter("remainDays"));
            String startDateString = request.getParameter("startDateText");
            String endDateString = request.getParameter("endDateText");
//            String startDateString = "2018-01-01";
//            String endDateString = "2018-01-10";

            Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateString);
            Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateString);
            String reason = request.getParameter("reason");

            long timeDifference = endDate.getTime() - startDate.getTime();
            //float daysBetween = (difference / (1000*60*60*24));
            float daysDifference = (TimeUnit.DAYS.convert(timeDifference, TimeUnit.MILLISECONDS)) + 1;
            
            float availableDays = remainDays - daysDifference;

            Leave leave = new Leave();
            AvailableDay availableDay = new AvailableDay();

            leave.setUserId(2);
            leave.setLeaveTypeId(leaveTypeId);
            leave.setLeaveDays(daysDifference);
            leave.setStartDate(startDateString);
            leave.setEndDate(endDateString);
            leave.setReason(reason);
            leave.setLeaveStatusId(1);

            availableDay.setUserId(2);
            availableDay.setLeaveTypeId(leaveTypeId);
            availableDay.setAvailableDays(availableDays);

            LeaveDao leaveDao = new LeaveDao();
            leaveDao.requestLeave(leave, availableDay);

        } catch (ParseException ex) {
            System.out.println("Date parsing error: " + ex.getMessage() + "\n" + ex);
        } catch (NullPointerException ex) {
            System.out.println("Null value return error: " + ex.getMessage() + "\n" + ex);
        }
//        request.getRequestDispatcher("./EmployeeHomeController").forward(request, response);
        response.sendRedirect("EmployeeHomeController");
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
