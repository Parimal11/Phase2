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
    <title>Available Zumba Slots</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Available Zumba Slots</h2>
        <table>
            <tr>
                <th>Trainer Name</th>
                <th>Slot Date</th>
                <th>Slot Time</th>
                <th>Max Slots</th>
                <th>Action</th>
            </tr>
            <%
                for (Trainer trainer : trainers) {
            %>
            <tr>
                <td><%= trainer.getName() %></td>
                <td><%= trainer.getSlotDate() %></td>
                <td><%= trainer.getSlotTime() %></td>
                <td><%= trainer.getMaxSlots() %></td>
                <td><a href="register_slot.jsp?trainer_id=<%= trainer.getTrainerId() %>">Register</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>