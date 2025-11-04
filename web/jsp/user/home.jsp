<%-- 
    Document   : home
    Created on : Jul 19, 2025, 2:55:21 AM
    Author     : trann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="model.User" %>
        <%
            User u = (User) session.getAttribute("user");
            if (u == null || u.getRole() != 0) {
                response.sendRedirect("jsp/user/home.jsp");
                return;
            }
        %>
        <h2>Welcome User: <%= u.getFullName() %></h2>

    </body>
</html>
