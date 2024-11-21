<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.TrainerDAO" %>
<%
    int trainerId = Integer.parseInt(request.getParameter("id"));
    TrainerDAO trainerDAO = new TrainerDAO();
    trainerDAO.deleteTrainer(trainerId); // Assuming this method exists
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Trainer</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Trainer Deleted</h2>
        <p>The trainer with ID <%= trainerId %> has been successfully deleted.</p>
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>