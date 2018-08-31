package com.leavesystem.data;

import com.leavesystem.model.AvailableDay;
import com.leavesystem.model.Leave;
import java.util.List;

public interface ILeave {
    public Leave setLeave();
    public void requestLeave(Leave leave, AvailableDay availableDay);
    public List viewLeave();
    public List viewLeaveByLeaveTypeId(Integer leaveTypeId);
    public void updateLeaveStatus(Integer leaveStatusId, Integer leaveId);
}
