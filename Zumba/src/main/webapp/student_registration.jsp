<%@ page import="com.cisco.dao.StudentDAO" %>
<%@ page import="com.cisco.pojo.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Registration</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <h2>Register</h2>
    <form action="student_registration_process.jsp" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        Email: <input type="email" name="email" required><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>