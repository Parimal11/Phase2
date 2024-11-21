<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.pojo.Admin, com.cisco.dao.AdminDAO" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    AdminDAO adminDAO = new AdminDAO();
    Admin admin = adminDAO.getAdmin(username, password);

    if (admin != null) {
        session.setAttribute("admin_id", admin.getId());
        response.sendRedirect("admin_dashboard.jsp");
    } else {
        out.println("Invalid credentials. <a href='admin_login.jsp'>Try again</a>");
    }
%>