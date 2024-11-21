<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.TrainerDAO, com.cisco.pojo.Trainer" %>
<%@ page import="java.util.*" %>
<%
    TrainerDAO trainerDAO = new TrainerDAO();
    List<Trainer> trainers = trainerDAO.getAllTrainers();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Admin Dashboard</h2>
        <h3>Manage Trainers</h3>
        <table>
            <tr>
                <th>Trainer Name</th>
                <th>Slot Date</th>
                <th>Slot Time</th>
                <th>Max Slots</th>
                <th>Actions</th>
            </tr>
            <%
                for (Trainer trainer : trainers) {
            %>
            <tr>
                <td><%= trainer.getName() %></td>
                <td><%= trainer.getSlotDate() %></td>
                <td><%= trainer.getSlotTime() %></td>
                <td><%= trainer.getMaxSlots() %></td>
                <td>
                    <a href="edit_trainer.jsp?id=<%= trainer.getTrainerId() %>">Edit</a>
                    <a href="delete_trainer.jsp?id=<%= trainer.getTrainerId() %>">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <p><a href="add_trainer.jsp">Add New Trainer</a></p>
    </div>
</body>
</html>