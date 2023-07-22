<%-- 
    Document   : history
    Created on : Jul 12, 2023, 6:26:37 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="../css/myStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <head>
        <title>Welcome to Our Cafe</title>
        <style>

            table {
                background-color: rgba(0,0,0,0.7);
                width: 100%;
                border-collapse: collapse;
                border-radius: 10px ;
            }

            th, td {
                padding: 10px;
                text-align: left;
                color:white;
            }

            th {

                text-align: center;
            }

            td.type {
                text-align: center;
            }
            td.button{
                text-align: center;
            }

            label{
                color:white;
            }
            .type{
                border-radius: 5px
            }

            .content{
                width: 100%;
                height: 200px;
                border-radius: 5px
            }


            input.button{
                display: inline-block;
                padding: 2px 9px;
                margin: 20px 0;
                background-color: #ebaa71;
                color: #fff;
                border: none;
                text-decoration: none;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s;

            }


            input.button:hover {
                background-color: #e49958;
                color: #ff3300;
                text-decoration: none;
            }

        </style>
    </head>
    <body>
        <nav>
            <ul class="navigation-menu">

               <li><a href="./home">Home</a></li>
                <li><a href="./foodList">View Food</a></li>
                <li><img src="../img/logo.png"></li>
                <li  class="active"><a href="./showFeedback">Show Feedback</a></li>
<!--                <li class="dropdown">
                    <a href="#">Setting</a>
                    <ul>
                        <li><a href="./update">Change Information</a></li>
                        <li><a href="#">Change Password</a></li>
                    </ul>
                </li>-->

                <li><a href="./logout">Logout</a></li>

            </ul>
        </nav>
        <div class="container">
            <table border="1px">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer ID</th>
                        <th>Content</th>     
                        <th>Type</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="feedback" items="${requestScope.feedback}" >
                        <tr>
                            <td><c:out value="${feedback.getId()}"></c:out></td>
                            <td><c:out value="${feedback.getCustomerName()}"></c:out></td>
                            <td><c:out value="${feedback.getContent()}"></c:out></td>
                            <td><c:out value="${feedback.getType()}"></c:out></td>
                            <td><c:out value="${feedback.getDate()}"></c:out></td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
