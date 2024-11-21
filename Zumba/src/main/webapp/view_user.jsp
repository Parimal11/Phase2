<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.UserDAO, com.cisco.pojo.User" %>
<%
    int userId = Integer.parseInt(request.getParameter("id"));
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>View User</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>User Details</h2>
        <p>User ID: <%= user.getUserId() %></p>
        <p>Name: <%= user.getName() %></p>
        <p>Phone Number: <%= user.getPhoneNumber() %></p>
        <p>Email: <%= user.getEmail() %></p>
        <p>Gender: <%= user.getGender() %></p>
        <p>Trainer ID: <%= user.getTrainerId() %></p>
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>