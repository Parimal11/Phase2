<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        <form action="admin_login_process.jsp" method="post">
            Username: <input type="text" name="username" required>

            Password: <input type="password" name="password" required>

            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>