<%-- 
    Document   : student.jsp
    Created on : Jun 1, 2023, 2:36:10 PM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Students List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script>
            function doDelete(id) {
                if (confirm("Are you sure to delete id = " + id + " ?")) {
                    window.location = "delete?id=" + id;
                }
            }
        </script>

    </head>
    <body>
        <div class="container">
            <h1 style="text-align: center">List of Students</h1>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Birthday</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="students" items="${requestScope.students}">
                        <tr>
                            <td><c:out value="${students.getId()}" ></c:out> </td>
                            <td><c:out value="${students.getName()}" ></c:out> </td>
                            <td><c:out value="${students.getBirthday()}" ></c:out> </td>
                            <td><c:out value="${students.getGender()}" ></c:out> </td>
                            <td><c:out value="${students.getEmail()}" ></c:out> </td>
                            <td><c:out value="${students.getPhone()}" ></c:out> </td>
                            <td><c:out value="${students.getAddress()}" ></c:out> </td>
                            <td><a href="update?id=${students.getId()}" >Update</a>  &nbsp&nbsp
                                <a href="#" onclick="doDelete('${students.getId()}')">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
