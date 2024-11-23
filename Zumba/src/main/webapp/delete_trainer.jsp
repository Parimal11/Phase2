<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.TrainerDAO" %>
<%
    int trainerId = Integer.parseInt(request.getParameter("id"));
    TrainerDAO trainerDAO = new TrainerDAO();
    boolean isDeleted = false;

    try {
        trainerDAO.deleteTrainer(trainerId); // Assuming this method exists
        isDeleted = true; // Set to true if deletion is successful
    } catch (Exception e) {
        e.printStackTrace(); // Log the error for debugging
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Trainer</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Trainer Deletion Status</h2>
        <%
            if (isDeleted) {
        %>
            <p>The trainer with ID <%= trainerId %> has been successfully deleted.</p>
        <%
            } else {
        %>
            <p>Error: The trainer with ID <%= trainerId %> could not be found or deleted.</p>
        <%
            }
        %>
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>