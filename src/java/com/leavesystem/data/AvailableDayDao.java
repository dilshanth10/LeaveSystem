package com.leavesystem.data;

import com.leavesystem.model.AvailableDay;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AvailableDayDao {
    Connection con = null;
    Statement stmt = null;
    
    public List viewAvailableDaysByUserAndLeaveType(Integer userId, Integer leaveTypeId){
        String sql = "SELECT * FROM available_day WHERE user_id=" + userId + " AND leave_type_id=" + leaveTypeId;
        List<AvailableDay> availableDayList = new ArrayList<>();
        try{
            con = DbConnection.connect();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                AvailableDay availableDay = new AvailableDay();
                availableDay.setUserId(rs.getInt("user_id"));
                availableDay.setLeaveTypeId(rs.getInt("leave_type_id"));
                availableDay.setAvailableDays(rs.getFloat("available_days"));
                availableDayList.add(availableDay);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AvailableDayDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return availableDayList;
    }
}
