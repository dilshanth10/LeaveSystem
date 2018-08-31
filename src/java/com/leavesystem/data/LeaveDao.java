package com.leavesystem.data;

import com.leavesystem.model.AvailableDay;
import com.leavesystem.model.Leave;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LeaveDao implements ILeave {

    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql;

    @Override
    public Leave setLeave() {
        Leave leave = new Leave();
        try {
            leave.setLeaveId(rs.getInt("leave_id"));
            leave.setUserId(rs.getInt("user_id"));
            leave.setUsername(rs.getString("username"));
            leave.setLeaveTypeId(rs.getInt("leave_type_id"));
            leave.setLeaveType(rs.getString("leave_type"));
            leave.setLeaveDays(rs.getFloat("leave_days"));
            leave.setRemainDays(rs.getFloat("available_days"));
            leave.setStartDate(rs.getString("start_date"));
            leave.setEndDate(rs.getString("end_date"));
            leave.setReason(rs.getString("reason"));
            leave.setLeaveStatusId(rs.getInt("leave_status_id"));
            leave.setLeaveStatus(rs.getString("leave_status"));
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return leave;
    }

    @Override
    public void requestLeave(Leave leave, AvailableDay availableDay) {
        sql = "INSERT INTO leave_detail (user_id, leave_type_id, leave_days, start_date, end_date, reason, leave_status_id) "
                + "VALUES (?,?,?,?,?,?,?)";
        
        String sqlx = "UPDATE available_day SET available_days=? WHERE user_id=? AND leave_type_id=?";

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, leave.getUserId());
            pstmt.setInt(2, leave.getLeaveTypeId());
            pstmt.setFloat(3, leave.getLeaveDays());
            pstmt.setString(4, leave.getStartDate());
            pstmt.setString(5, leave.getEndDate());
            pstmt.setString(6, leave.getReason());
            pstmt.setInt(7, leave.getLeaveStatusId());
            pstmt.executeUpdate();
            
            pstmt = con.prepareStatement(sqlx);
            pstmt.setFloat(1, availableDay.getAvailableDays());
            pstmt.setInt(2, availableDay.getUserId());
            pstmt.setInt(3, availableDay.getLeaveTypeId());
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Insert Query Error: " + ex.getMessage());
        }
    }

    @Override
    public List viewLeave() {
        sql = "SELECT ld.leave_id, user.user_id, user.username, lt.leave_type_id, lt.leave_type, "
                + "ad.available_days, ld.leave_days, ld.start_date, ld.end_date, ld.reason, ls.leave_status_id, ls.leave_status "
                + "FROM leave_detail ld "
                + "JOIN leave_type lt ON ld.leave_type_id=lt.leave_type_id "
                + "JOIN leave_status ls ON ls.leave_status_id=ld.leave_status_id "
                + "JOIN user ON user.user_id=ld.user_id "
                + "JOIN available_day ad ON ld.user_id=ad.user_id "
                + "AND ld.leave_type_id=ad.leave_type_id "
                + "ORDER BY start_date DESC";

        List<Leave> leaveList = new ArrayList<>();

        try {
            con = DbConnection.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Leave leave = setLeave();
                leaveList.add(leave);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return leaveList;
    }

    @Override
    public List viewLeaveByLeaveTypeId(Integer leaveTypeId) {
        sql = "SELECT * FROM leave_detail WHERE leave_type_id=" + leaveTypeId;

        List<Leave> leaveList = new ArrayList<>();

        try {
            con = DbConnection.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Leave leave = setLeave();
                leaveList.add(leave);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return leaveList;
    }
    
    @Override
    public void updateLeaveStatus(Integer leaveStatusId, Integer leaveId){
        sql = "UPDATE leave_detail SET leave_status_id=? WHERE leave_id=?";
        
        try{
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, leaveStatusId);
            pstmt.setInt(2, leaveId);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LeaveDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
