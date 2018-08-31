package com.leavesystem.data;

import com.leavesystem.model.LeaveType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LeaveTypeDao implements ILeaveType{

    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql;

    @Override
    public LeaveType setLeaveType() {
        LeaveType leaveType = new LeaveType();
        try {
            leaveType.setLeaveTypeId(rs.getInt("leave_type_id"));
            leaveType.setLeaveType(rs.getString("leave_type"));
            leaveType.setAllocationPeriod(rs.getFloat("allocation_period"));
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return leaveType;
    }

    @Override
    public List viewLeaveType() {
        sql = "SELECT * FROM leave_type";

        List<LeaveType> leaveList = new ArrayList<>();

        try {
            con = DbConnection.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                LeaveType leaveType = setLeaveType();
                leaveList.add(leaveType);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return leaveList;
    }
}
