<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.pojo.Trainer, com.cisco.dao.TrainerDAO" %>
<%
    int trainerId = Integer.parseInt(request.getParameter("id"));
    TrainerDAO trainerDAO = new TrainerDAO();
    Trainer trainer = trainerDAO.getTrainerById(trainerId);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Trainer</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Edit Trainer</h2>
        <form action="edit_trainer_process.jsp" method="post">
            <input type="hidden" name="trainer_id" value="<%= trainer.getTrainerId() %>">
            Name: <input type="text" name="name" value="<%= trainer.getName() %>" required><br>
            Slot Date: <input type="date" name="slot_date" value="<%= trainer.getSlotDate() %>" required><br>
            Slot Time: <input type="time" name="slot_time" value="<%= trainer.getSlotTime() %>" required><br>
            Max Slots: <input type="number" name="max_slots" value="<%= trainer.getMaxSlots() %>" required><br>
            Trainer Email: <input type="email" name="trainer_email" value="<%= trainer.getTrainerEmail() %>" required><br> <!-- New email field -->
            <input type="submit" value="Update Trainer">
        </form>
    </div>
</body>
</html>