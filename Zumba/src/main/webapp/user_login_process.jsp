<%@ page import="com.cisco.dao.StudentDAO" %>
<%@ page import="com.cisco.pojo.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get parameters from the login form
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Create an instance of StudentDAO to interact with the database
    StudentDAO studentDAO = new StudentDAO();
    Student student = studentDAO.getStudentByEmail(email); // Call the updated method
	
  
    // Check if the student exists and the password matches
    if (student != null && student.getPassword().equals(password)) {
        // Successful login
        session.setAttribute("loggedInUser", student);
        System.out.println("User logged in: " + student.getUsername()); // Debugging line
        response.sendRedirect("user_dashboard.jsp"); // Redirect to the dashboard
    } else {
        // Login failed
        request.setAttribute("errorMessage", "Invalid email or password.");
        request.getRequestDispatcher("user_login.jsp").forward(request, response); // Forward back to login page
    }
%>