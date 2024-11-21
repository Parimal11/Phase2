package com.cisco.dao;

import java.sql.*;

import com.cisco.dbutil.DbUtil;
import com.cisco.pojo.Admin;

public class AdminDAO {
    public Admin getAdmin(String username, String password) {
        Admin admin = null;
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?")) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}
