package com.cisco.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.cisco.dbutil.DbUtil;
import com.cisco.pojo.User;

public class UserDAO {
    public void registerUser(User user) {
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO user (name, phone_number, email, gender,trainer_email) VALUES (?, ?, ?, ?,?)")) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getPhoneNumber());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getGender());
            ps.setString(5,	user.getTrainerEmail());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean registerForSlot(String userName, String trainerEmail) {
        String sql = "INSERT INTO registrations (username, trainer_email) VALUES (?, ?)";
        try (Connection con = DbUtil.getConnection(); // Assuming you have a DbUtil class for DB connection
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, userName);
            ps.setString(2, trainerEmail);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Return true if the registration was successful
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
            return false; // Return false if there was an error
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
                user.setTrainerEmail(rs.getString("trainer_email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT u.*, t.trainer_email AS trainer_email FROM user u LEFT JOIN trainer t ON u.trainer_email = t.trainer_email"); // Updated SQL query
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setEmail(rs.getString("email")); // Assuming this is the correct field for user email
                user.setGender(rs.getString("gender"));
                user.setTrainerEmail(rs.getString("trainer_email")); // Set trainer email instead of trainer ID
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        return userList;
    }
   
    
    public User getUserById(int userId) {
        User user = null;
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE user_id = ?")) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
                user.setTrainerEmail(rs.getString("trainer_email"));// Assuming this column exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public void deleteUser(int userId) {
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM user WHERE user_id = ?")) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean updateUser(User user) {
        String sql = "UPDATE users SET name = ?, phone_number = ?, email = ?, gender = ?, trainer_email = ? WHERE user_id = ?";
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getPhoneNumber());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getTrainerEmail());
            ps.setInt(6, user.getUserId());
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Return true if the update was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false if there was an error
        }
    }
}
