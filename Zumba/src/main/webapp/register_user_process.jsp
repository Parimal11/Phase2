<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.pojo.User, com.cisco.dao.UserDAO" %>
<%
    String name = request.getParameter("name");
    String phoneNumber = request.getParameter("phone_number");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    String trainerEmail = request.getParameter("trainer_email"); // New field for trainer email

    User user = new User();
    user.setName(name);
    user.setPhoneNumber(phoneNumber);
    user.setEmail(email); // Assuming this is the correct method for user email
    user.setGender(gender);
    user.setTrainerEmail(trainerEmail); // Set trainer email

    UserDAO userDAO = new UserDAO();
    userDAO.registerUser(user); // Ensure this method is updated to handle trainer_email
%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Success</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Registration Successful!</h2>
        <p>You have registered successfully. <a href="user_dashboard.jsp">Hurray!</a></p>
    </div>
</body>
</html>