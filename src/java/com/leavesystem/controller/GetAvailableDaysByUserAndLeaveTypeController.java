package com.leavesystem.controller;

import com.leavesystem.data.AvailableDayDao;
import com.leavesystem.model.AvailableDay;
import com.leavesystem.model.Leave;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="GetAvailableDaysByUserAndLeaveTypeController", urlPatterns={"/GetAvailableDaysByUserAndLeaveTypeController"})
public class GetAvailableDaysByUserAndLeaveTypeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        Integer userId = 2;
        Integer leaveTypeId = Integer.parseInt(request.getParameter("leaveTypeId"));
        
        AvailableDayDao availableDaysDao = new AvailableDayDao();
        List<AvailableDay> availableDaysList = availableDaysDao.viewAvailableDaysByUserAndLeaveType(userId, leaveTypeId);
        
        response.setContentType("application/json");
        PrintWriter writer = response.getWriter();
        
        JsonObjectBuilder rootbuilder = Json.createObjectBuilder();
        
        JsonArrayBuilder arrayBuilder = Json.createArrayBuilder();
        JsonObject leaveJson = null;
        
        for(AvailableDay availableDay : availableDaysList){
            JsonObjectBuilder leaveBuilder = Json.createObjectBuilder();
            
            leaveJson = leaveBuilder
                    .add("AvailableDays", availableDay.getAvailableDays())
                    .build();
            arrayBuilder.add(leaveJson);
        }
        
        JsonObject root = rootbuilder.add("AvailableDay", arrayBuilder).build();
        
        writer.print(root);
        
        writer.flush();
        writer.close();
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
