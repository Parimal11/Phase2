<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.TrainerDAO" %>
<%@ page import="com.cisco.pojo.Trainer" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Trainer Process</title>
</head>
<body>
<%
    TrainerDAO trainerDAO = new TrainerDAO();
    Trainer trainer = new Trainer();
    trainer.setName(request.getParameter("name"));
    trainer.setSlotDate(request.getParameter("slot_date"));
    trainer.setSlotTime(request.getParameter("slot_time"));
    trainer.setMaxSlots(Integer.parseInt(request.getParameter("max_slots")));

    boolean isAdded = trainerDAO.addTrainer(trainer);
    if (isAdded) {
%>
        <h2>Trainer added successfully!</h2>
<%
    } else {
%>
        <h2>Error adding trainer. Please try again.</h2>
<%
    }
%>
    <a href="add_trainer.jsp">Add another trainer</a>
</body>
</html>