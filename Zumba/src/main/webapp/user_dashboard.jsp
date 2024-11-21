<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.pojo.Student" %>
<%
    Student loggedInUser = (Student) session.getAttribute("loggedInUser");
    String userName = (loggedInUser != null) ? loggedInUser.getUsername() : null;

    if (userName == null) {
        response.sendRedirect("user_login.jsp");
        return; // Stop further processing
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= userName %>!</h2>
        <p><a href="view_slots.jsp">View Available Zumba Slots</a></p>
        <p><a href="logout.jsp">Logout</a></p>
    </div>
</body>
</html>