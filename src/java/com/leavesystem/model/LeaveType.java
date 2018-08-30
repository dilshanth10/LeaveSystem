package com.leavesystem.model;

public class LeaveType {
    Integer leaveTypeId;
    String leaveType;
    float allocationPeriod;

    public Integer getLeaveTypeId() {
        return leaveTypeId;
    }

    public void setLeaveTypeId(Integer leaveTypeId) {
        this.leaveTypeId = leaveTypeId;
    }

    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
    }

    public float getAllocationPeriod() {
        return allocationPeriod;
    }

    public void setAllocationPeriod(float allocationPeriod) {
        this.allocationPeriod = allocationPeriod;
    }
}
