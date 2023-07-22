<%-- 
    Document   : booksList
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
            function addNewBook() {
                window.location = "addbook";
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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <h2>Book List</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Author</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="books" items="${requestScope.books}">
                        <tr>
                            <td><c:out value="${books.getBookId()}"></c:out></td>
                            <td><c:out value="${books.getName()}"></c:out></td>
                            <td><c:out value="${books.getDescription()}"></c:out></td>
                            <td><c:out value="${books.getPrice()}"></c:out></td>
                            <td><c:out value="${books.getAuthor()}"></c:out></td>
                            <td><a href="#" onclick="deleteID('${books.getBookId()}')">Delete</a>&nbsp;&nbsp;
                                <a href="#" onclick="updateID('${books.getBookId()}')">Update</a></td>
                            </c:forEach>
                </tbody>
            </table>
            <button onclick="addNewBook()" type="submit" class="btn btn-primary">Add new book</button>

        </div>

    </body>
</html>
