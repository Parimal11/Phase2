<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.UserDAO, com.cisco.pojo.User" %>
<%
    int trainerId = Integer.parseInt(request.getParameter("trainer_id"));
    String userName = (String) session.getAttribute("user_name");
    
    // Assuming you have a method to register the user for a slot
    // You might want to implement a method in UserDAO to handle this
    UserDAO userDAO = new UserDAO();
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
         <a href="register_user.jsp">Go back to Dashboard</a>
    </div>
</body>
</html>