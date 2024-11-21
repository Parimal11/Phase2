package com.cisco.dao;

import java.sql.*;
import com.cisco.dbutil.DbUtil;
import com.cisco.pojo.Student;

public class StudentDAO {
    
    // Method to register a new student
    public boolean registerStudent(Student student) {
        boolean success = false;
        String sql = "INSERT INTO students (username, password, email) VALUES (?, ?, ?)";
        
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, student.getUsername());
            ps.setString(2, student.getPassword()); // Consider hashing the password
            ps.setString(3, student.getEmail());
            int rowsAffected = ps.executeUpdate();
            success = (rowsAffected > 0); // Check if the insert was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // Method to retrieve a student by username
 // Method to retrieve a student by email
    public Student getStudentByEmail(String email) {
        Student student = null;
        String sql = "SELECT * FROM students WHERE email=?";
        
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                student = new Student();
                student.setStudentId(rs.getInt("student_id"));
                student.setUsername(rs.getString("username"));
                student.setPassword(rs.getString("password"));
                student.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }
}
