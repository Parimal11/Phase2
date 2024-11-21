<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>User Login</h2>
        <form action="user_login_process.jsp" method="post">
            Email: <input type="email" name="email" required>

            Password: <input type="password" name="password" required>

            <input type="submit" value="Login">
        </form>
        <p>Don't have an account? <a href="student_registration.jsp">Register here</a></p>
    </div>
</body>
</html>