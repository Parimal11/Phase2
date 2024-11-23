<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>User Registration</h2>
        <form action="register_user_process.jsp" method="post">
            Name: <input type="text" name="name" required>

            Phone Number: <input type="text" name="phone_number" required>

            Email: <input type="email" name="email" required>

            Gender: <input type="text" name="gender" required>
            
            Trainer Email: <input type="email" name="trainer_email" required><br>

            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>