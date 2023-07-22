<%-- 
    Document   : Home
    Created on : Jul 11, 2023, 1:38:00 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
!<!doctype html>
<html>

    <head>

        <title>Welcome to Our Cafe</title>
        <!-- Link Bootstrap CSS -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="../css/myStyle.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;500&display=swap" rel="stylesheet">
        <style>
            #footer {
                padding: 50px 0 0;
            }

            .footer-info .widget>.title {
                border-bottom: 1px solid;
                color: white;
                line-height: 40px;
                margin-bottom: 10px;
            }

            .footer-info .text {
                display: inline-block;
                color: white;
                width: 100%;
                margin-bottom: 20px;
                position: relative;
            }

            .footer-info .contact-us .fa {
                font-size: 24px;
                margin-right: 10px;
            }

            .footer-info .contact-us p span {
                overflow: hidden;
            }

            .footer-info ul {
                list-style: none;
                margin: 0;
                padding: 0;
                line-height: 26px;
            }

            .fa {
                display: inline-block;
                font: normal normal normal 14px/1 FontAwesome;
                font-size: inherit;
                text-rendering: auto;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }

            .footer-info a {
                color: inherit;
            }
        </style>
        <!-- Add your custom CSS styles -->
    </head>

    <body>
        <nav>
            <ul class="navigation-menu">

                <li class="active"><a href="#">Home</a></li>
                <li><a href="./foodList">View Food</a></li>
                <li><img src="../img/logo.png"></li>
                <li><a href="./showFeedback">Show Feedback</a></li>
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
        <div class="container-fluid text-center" style="width: 100%;">
            <h1>Hello, ${name}! Have a nice day!</h1>
        </div>

    </body>
</html>
