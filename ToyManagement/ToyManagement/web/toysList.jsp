<%-- 
    Document   : toysList
    Created on : Jun 27, 2023, 9:46:41 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>

            body {
                background-color: #f8f9fa;
                padding: 20px;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
            }

            h2 {
                text-align: center;
                margin-bottom: 30px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            th,
            td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #007bff;
                color: #fff;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .btn-primary {
                width: 100%;
            }
        </style>
        <script>
            function addNewToy() {
                window.location = "add";
            }

            function deleteID(id) {
                if (confirm("Are you sure to delete ID = " + id + " ?")) {
                    window.location = "delete?id=" + id;
                }
            }

            function updateID(id) {
                window.location = "update?id=" + id;
            }
        </script>
        <title>Toy List</title>
    </head>
    <body>
        <div class="container-fluid">
            <h2>Toy List</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="toys" items="${requestScope.toys}">
                        <tr>
                            <td><c:out value="${toys.getId()}"></c:out></td>
                            <td><c:out value="${toys.getName()}"></c:out></td>
                            <td><c:out value="${toys.getDescription()}"></c:out></td>
                            <td><c:out value="${toys.getCategory()}"></c:out></td>
                            <td><c:out value="${toys.getPrice()}"></c:out></td>
                            <td><c:out value="${toys.getQuantity()}"></c:out></td>
                            <td><a href="#" onclick="deleteID('${toys.getId()}')">Delete</a> &nbsp;&nbsp;
                                <a href="#" onclick="updateID('${toys.getId()}')">Update</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button onclick="addNewToy()" type="submit" class="btn btn-primary">Add new toy</button>

        </div>

    </body>
</html>
