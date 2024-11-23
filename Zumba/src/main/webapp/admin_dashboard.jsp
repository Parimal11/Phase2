<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.TrainerDAO, com.cisco.pojo.Trainer" %>
<%@ page import="com.cisco.dao.UserDAO, com.cisco.pojo.User" %>
<%@ page import="java.util.*" %>
<%
    // Fetch all trainers
    TrainerDAO trainerDAO = new TrainerDAO();
    List<Trainer> trainers = trainerDAO.getAllTrainers();

    // Fetch all users
    UserDAO userDAO = new UserDAO();
    List<User> users = userDAO.getAllUsers(); // Assuming this method exists
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
                <th>Trainer Email</th>
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
                <td><%= trainer.getTrainerEmail() %>
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

        <h3>Registered Users</h3>
        <table>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Trainer Email</th> <!-- Updated to Trainer Email -->
                <th>Actions</th>
            </tr>
            <%
                for (User user : users) {
                    // Fetch the trainer email based on trainerId
                    String trainerEmail = trainerDAO.getTrainerNameByEmail(user.getTrainerEmail()); // Updated method
            %>
            <tr>
                <td><%= user.getUserId() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getPhoneNumber() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getGender() %></td>
                <td><%= trainerEmail != null ? trainerEmail : "N/A" %></td> <!-- Display trainer email -->
                <td>
                    <a href="edit_user.jsp?id=<%= user.getUserId() %>">Edit</a>
                    <a href="delete_user.jsp?id=<%= user.getUserId() %>">Delete</a>
                    <a href="view_user.jsp?id=<%= user.getUserId() %>">View</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        
        <p><a href="register_user.jsp">Add New User</a></p>
    </div>
</body>
</html>