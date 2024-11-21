<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.UserDAO" %>
<%
    int userId = Integer.parseInt(request.getParameter("id"));
    UserDAO userDAO = new UserDAO();
    userDAO.deleteUser(userId); // Assuming this method exists
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>User Deleted</h2>
        <p>The user with ID <%= userId %> has been successfully deleted.</p>
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>