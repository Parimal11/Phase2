<%@ page import="com.cisco.dao.StudentDAO" %>
<%@ page import="com.cisco.pojo.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");

    Student student = new Student();
    student.setUsername(username);
    student.setPassword(password); // Consider hashing the password
    student.setEmail(email);

    StudentDAO studentDAO = new StudentDAO();
    boolean isRegistered = studentDAO.registerStudent(student);

    if (isRegistered) {
%>
        <h2>Registration successful!</h2>
<%
    } else {
%>
        <h2>Registration failed. Username or email may already be in use.</h2>
<%
    }
%>