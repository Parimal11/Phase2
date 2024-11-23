<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.UserDAO" %>
<%@ page import="com.cisco.pojo.User" %>
<%
    // Retrieve form parameters
    int userId = Integer.parseInt(request.getParameter("user_id"));
    String name = request.getParameter("name");
    String phoneNumber = request.getParameter("phone_number");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    String trainerEmail = request.getParameter("trainer_email");

    // Create UserDAO instance
    UserDAO userDAO = new UserDAO();

    // Create a User object with the updated information
    User user = new User();
    user.setUserId(userId);
    user.setName(name);
    user.setPhoneNumber(phoneNumber);
    user.setEmail(email);
    user.setGender(gender);
    user.setTrainerEmail(trainerEmail); // Assuming you have a setter for trainer email

    // Update user in the database
    boolean updateSuccess = userDAO.updateUser(user); // Assuming this method exists

    // Redirect based on the update result
    if (updateSuccess) {
        response.sendRedirect("admin_dashboard.jsp?message=User updated successfully");
    } else {
        response.sendRedirect("edit_user.jsp?id=" + userId + "&error=Failed to update user");
    }
%>