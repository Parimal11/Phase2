<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.pojo.Trainer, com.cisco.dao.TrainerDAO" %>
<%
    int trainerId = Integer.parseInt(request.getParameter("trainer_id"));
    String name = request.getParameter("name");
    String slotDate = request.getParameter("slot_date");
    String slotTime = request.getParameter("slot_time");
    int maxSlots = Integer.parseInt(request.getParameter("max_slots"));

    Trainer trainer = new Trainer();
    trainer.setTrainerId(trainerId);
    trainer.setName(name);
    trainer.setSlotDate(slotDate);
    trainer.setSlotTime(slotTime);
    trainer.setMaxSlots(maxSlots);

    TrainerDAO trainerDAO = new TrainerDAO();
    trainerDAO.updateTrainer(trainer);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Success</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
</head>
<body>
    <div class="container">
        <h2>Trainer Updated Successfully!</h2>
        <p><a href="admin_dashboard.jsp">Go back to Dashboard</a></p>
    </div>
</body>
</html>