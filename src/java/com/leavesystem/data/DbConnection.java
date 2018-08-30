package com.leavesystem.data;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbConnection {
    static Connection con = null;
    static Statement stmt = null;
    static PreparedStatement pstmt = null;
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String URL = "jdbc:mysql://localhost/leavesystem?useSSL=false";
    static final String USER = "root";
    static final String PASSWORD = "manager";
    
    protected static Connection connect(){
        try{
            Class.forName(JDBC_DRIVER);
            System.out.println("JDBC Driver Connection Successful");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
    
    protected static void closeConnection(){
        if(stmt != null){
            try {
                stmt.close();
                System.out.println("SQL Statement Closed");
            } catch (SQLException ex) {
                Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Exception: SQL Statement isn't Close");
            }
        }
        if(pstmt != null){
            try {
                pstmt.close();
                System.out.println("SQL Preparestatement Closed");
            } catch (SQLException ex) {
                Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Exception: SQL Preparestatement isn't Close");
            }
        }
        if(con != null){
            try {
                con.close();
                System.out.println("DB Connection Closed");
            } catch (SQLException ex) {
                Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Exception: DB Connection isn't Close");
            }
        }
    }
}
