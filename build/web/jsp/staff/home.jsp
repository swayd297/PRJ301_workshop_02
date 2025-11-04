<%-- 
    Document   : home
    Created on : Jul 19, 2025, 2:54:47 AM
    Author     : trann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.User" %>
<%@page import="model.Mobile" %>

<%
    User u = (User) session.getAttribute("user");
    if (u == null || u.getRole() != 1) {
        response.sendRedirect("../../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mobile Management</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #fff;
            }

            .container {
                width: 90%;
                margin: auto;
                padding-top: 20px;
            }

            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            header h1 {
                font-size: 22px;
                margin: 0;
            }

            header nav a {
                margin-left: 20px;
                text-decoration: none;
                color: gray;
            }

            h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .create-link {
                display: inline-block;
                margin-bottom: 10px;
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
            }

            .create-link:hover {
                text-decoration: underline;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 30px;
            }

            table thead tr {
                background-color: #f2f2f2;
            }

            table th, table td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: left;
            }

            table td a {
                color: #007bff;
                text-decoration: none;
                margin-right: 5px;
            }

            table td a:hover {
                text-decoration: underline;
            }

            body {
                font-family: 'Segoe UI', sans-serif;
                margin: 40px;
            }
            h1 {
                font-weight: bold;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                padding: 10px;
                border: 1px solid #ddd;
            }
            th {
                background-color: #f3f3f3;
            }
            a {
                color: #0066cc;
                text-decoration: none;
                font-weight: bold;
            }
            .header-actions {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .search-form input[type="text"] {
                padding: 6px;
                width: 250px;
            }
            .search-form input[type="submit"] {
                padding: 6px 12px;
                margin-left: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <header>
                <h1><strong>MobileShop</strong></h1>
                <nav>
                    <a href="#">Home</a>
                    <a href="#">Privacy</a>
                </nav>
            </header>

            <h2>Mobile List</h2>
            <div class="header-actions">
                <a class="create-link" href="../../InsertMobileServlet">Create New</a>
                <form class="search-form" action="${pageContext.request.contextPath}/SearchMobileServlet" method="get">
                    <input type="text" name="keyword" placeholder="Search by ID or Name"/>
                    <input type="submit" value="Search"/>
                </form>

            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Year</th>
                        <th>Quantity</th>
                        <th>Not Sale</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Mobile> list = (List<Mobile>) request.getAttribute("mobiles");
                        if (list != null && !list.isEmpty()) {
                            for (Mobile m : list) {
                    %>
                    <tr>
                        <td><%= m.getMobileID() %></td>
                        <td><%= m.getMobileName() %></td>
                        <td><%= m.getDescription() %></td>
                        <td><%= m.getPrice() %></td>
                        <td><%= m.getYearOfProduction() %></td>
                        <td><%= m.getQuantity() %></td>
                        <td><%= m.isNotSale() ? "Yes" : "No" %></td>
                        <td>
                            <a href="../../UpdateMobileServlet?id=<%= m.getMobileID() %>">Edit</a> |
                            <a href="../../MobileDetailsServlet?id=<%= m.getMobileID() %>">Details</a> |
                            <a href="../../DeleteMobileServlet?id=<%= m.getMobileID() %>" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr><td colspan="8">No mobiles found.</td></tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
