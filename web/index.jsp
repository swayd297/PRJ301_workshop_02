<%-- 
    Document   : login
    Created on : Jul 19, 2025, 2:47:53 AM
    Author     : trann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h2>Login</h2>
    <form action="LoginServlet" method="post">
        Username: <input type="text" name="userID" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
    <p style="color:red">${requestScope.error}</p>
    </body>
</html>
