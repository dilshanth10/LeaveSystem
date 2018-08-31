package com.leavesystem.data;

import com.leavesystem.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDao implements IUserDao {

    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql;

    @Override
    public User setUser() {
        User user = new User();
        try {
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setRoleId(rs.getInt("role_id"));
            user.setRoleName(rs.getString("role_name"));
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    @Override
    public void saveUser(String username, String password, String email, String roleId) {
        sql = "INSERT INTO user (username, password, email, role_id) values (?, ?, ?, ?)";

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(0, username);
            pstmt.setString(1, password);
            pstmt.setString(2, email);
            pstmt.setString(3, roleId);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbConnection.closeConnection();
        }
    }

    @Override
    public List checkUser(String username, String password) {
        sql = "SELECT * FROM user JOIN role ON user.role_id=role.role_id WHERE username='" + username + "' and password='" + password + "'";
        List<User> userList = new ArrayList<>();
        try {
            con = DbConnection.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                User user = setUser();
                userList.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbConnection.closeConnection();
        }
        return userList;
    }
}
