package com.cisco.dao;

import java.sql.*;

import com.cisco.dbutil.DbUtil;
import com.cisco.pojo.User;

public class UserDAO {
    public void registerUser(User user) {
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO user (name, phone_number, email, gender) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getPhoneNumber());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getGender());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserByEmail(String email) {
        User user = null;
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email=?")) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
