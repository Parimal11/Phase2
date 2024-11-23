<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.UserDAO, com.cisco.pojo.User" %>
<%
    String trainerEmail = request.getParameter("trainer_email"); // Change to trainer_email
    String userName = (String) session.getAttribute("user_name");
    
    // Check if the user is logged in
    if (userName == null) {
        response.sendRedirect("user_login.jsp");
        return; // Stop further processing
    }

    // Assuming you have a method to register the user for a slot
    UserDAO userDAO = new UserDAO();
    boolean registrationSuccess = userDAO.registerForSlot(userName, trainerEmail); // Update this method accordingly

    // Here you would typically also need to update the trainer's available slots
    // For simplicity, this example assumes a successful registration
%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Success</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Registration Successful!</h2>
        <p>You have successfully registered for the slot with trainer: <strong><%= trainerEmail %></strong>.</p>
        <a href="register_user.jsp">Go back to Dashboard</a>
    </div>
</body>
</html>