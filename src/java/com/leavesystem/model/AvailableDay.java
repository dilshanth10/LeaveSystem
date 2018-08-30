package com.leavesystem.model;

public class AvailableDay {
    Integer userId;
    Integer leaveTypeId;
    float availableDays;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getLeaveTypeId() {
        return leaveTypeId;
    }

    public void setLeaveTypeId(Integer leaveTypeId) {
        this.leaveTypeId = leaveTypeId;
    }

    public float getAvailableDays() {
        return availableDays;
    }

    public void setAvailableDays(float availableDays) {
        this.availableDays = availableDays;
    }
}
