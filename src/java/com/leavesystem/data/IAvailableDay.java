package com.leavesystem.data;

import java.util.List;

public interface IAvailableDay {

    public List viewAvailableDaysByUserAndLeaveType(Integer userId, Integer leaveTypeId);
}
