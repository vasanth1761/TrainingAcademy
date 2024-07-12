<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.chainsys.trainingacademy.model.Course"%>
    <%@page import="com.chainsys.trainingacademy.model.Users"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificate</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        body {
            color: black;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-family: Georgia, serif;
            font-size: 24px;
            text-align: center;
            background-color: #f4f4f4;
        }
        .container {
            border: 20px solid blue;
            width: 750px;
            height: 563px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            position: relative; 
        }
        .logo {
            color:blue;
            font-size: 28px;
            margin-top: 20px;
        }
        .marquee {
            color: tan;
            font-size: 48px;
            margin: 20px;
        }
        .assignment {
            margin: 20px;
        }
        .person {
            border-bottom: 2px solid black;
            font-size: 32px;
            font-style: italic;
            margin: 20px auto;
            width: 400px;
        }
        .reason {
            margin: 20px;
        }
        .download-btn-container {
            margin-top: 20px;
        }
        .button-container {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        .extra-course-link {
            text-decoration: underline;
            color: #007bff;
        }
        .adjust {
            bottom: 20px; 
            font-size: 16px;
            color: #666;
        }

        
    </style>
</head>
<body>
  <%Course course=(Course)session.getAttribute("course");
Users userName = (Users) session.getAttribute("userId");
%>
    <a onclick="window.print()">
        <div class="container">
            <div class="logo">
                <strong>SYSTECH</strong>
            </div>

            <div class="marquee">
                Certificate of Completion
            </div>

            <div class="assignment">
                This certificate is presented to
            </div>

            <div class="person">
               <%=userName.getName() %> 
            </div>

            <div class="reason">
              <%=course.getCourseName() %>  Course Successfully Completed 
            </div>


        </div>
    </a>

    <div class="adjust">
        <a href="thankYou.jsp" class="extra-course-link">Click here </a>to add an extra course
    </div>
</body>
</html>
