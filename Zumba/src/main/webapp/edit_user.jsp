<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.dao.UserDAO, com.cisco.pojo.User" %>
<%@ page import="java.util.*" %>
<%
    int userId = Integer.parseInt(request.getParameter("id"));
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId); // Assuming this method exists

    if (user == null) {
        response.sendRedirect("admin_dashboard.jsp"); // Redirect if user not found
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Edit User</h2>
        <form action="edit_user_process.jsp" method="post">
            <input type="hidden" name="user_id" value="<%= user.getUserId() %>">
            <label for="name">Name:</label>
            <input type="text" name="name" value="<%= user.getName() %>" required><br>

            <label for="phone_number">Phone Number:</label>
            <input type="text" name="phone_number" value="<%= user.getPhoneNumber() %>" required><br>

            <label for="email">Email:</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" required><br>

            <label for="gender">Gender:</label>
            <select name="gender" required>
                <option value="Male" <%= user.getGender().equals("Male") ? "selected" : "" %>>Male</option>
                <option value="Female" <%= user.getGender().equals("Female") ? "selected" : "" %>>Female</option>
                <option value="Other" <%= user.getGender().equals("Other") ? "selected" : "" %>>Other</option>
            </select><br>

            <label for="trainer_email">Trainer Email:</label>
            <input type="email" name="trainer_email" value="<%= user.getTrainerEmail() %>" required><br>

            <input type="submit" value="Update User">
        </form>
        <p><a href="admin_dashboard.jsp">Cancel</a></p>
    </div>
</body>
</html>