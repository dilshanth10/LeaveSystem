package com.leavesystem.data;

import com.leavesystem.model.User;
import java.util.List;

public interface IUserDao {
    public User setUser();
    public void saveUser(String username, String password, String email, String roleid);
    public List<User> checkUser(String username, String password);
}
