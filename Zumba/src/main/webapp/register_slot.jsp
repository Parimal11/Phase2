<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.UserDAO, com.cisco.pojo.User" %>
<%@ page import="com.cisco.pojo.Student" %>
<%
    String trainerEmail = request.getParameter("trainer_email"); // Change to trainer_email
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
    <title>Register for Slot</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Register for Slot</h2>
        <form action="register_slot_process.jsp" method="post">
            <input type="hidden" name="trainer_email" value="<%= trainerEmail %>"> <!-- Updated to trainer_email -->
            <p>Are you sure you want to register for this slot?</p>
            <input type="submit" value="Confirm Registration">
        </form>
    </div>
</body>
</html>