<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.trainingacademy.model.Questions" %>
<%@ page import="com.chainsys.trainingacademy.model.Users" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE>
<html>
<head>
    <title>Questions</title>
    <style>
     .navbar {
        display: flex;
        justify-content: space-between; 
        align-items: center;
        background-color: #0056b3;
        padding: 10px 20px;
        color: white;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
    }

    .navbar span {
        font-size: 18px;
        margin-right: 10px;
    }

    .navbar .profile-section {
        display: flex;
        align-items: center;
        cursor: pointer; 
        position: relative; 
    }

    .navbar img {
        width: 30px;
        height: 30px;
        margin-right: 10px;
        border-radius: 50%; 
    }
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .question {
            margin-bottom: 20px;
        }
        .question p {
            margin: 0;
        }
        .submit-btn {
            display: block;
            width: 150px; 
            padding: 10px 0;
            margin: 20px auto 0; 
            background-color: #0056b3; 
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>

<body>
 <% Users user = (Users) session.getAttribute("userId"); %>
<div class="navbar">
    <span>Systech</span>
    <div class="profile-section">
        <img src="image/profile.png" alt="User Symbol">
        <span class="username" id="username"><%= user.getName()%></span>
        
    </div>
</div> 
<br>
<br>
<br>

 <center><h1>Take Quiz</h1></center>
    <div class="container">
        <form action="CheckResult" method="post">
            <%
            List<Questions> questions = (List<Questions>) request.getAttribute("viewQuestion");
                                       int i=1;
                                       for(Questions question:questions) {
            %>
            <div class="question">
                
                <p><strong><%=i++ %></strong> .<%= question.getQuestion() %></p>
                <input type="hidden" name="questionId" value="<%= question.getId() %>">
                <p><input type="radio" name="answer<%= question.getId() %>" value="A"> <%= question.getOptionA() %></p>
                <p><input type="radio" name="answer<%= question.getId() %>" value="B"> <%= question.getOptionB() %></p>
                <p><input type="radio" name="answer<%= question.getId() %>" value="C"> <%= question.getOptionC() %></p>
                <p><input type="radio" name="answer<%= question.getId() %>" value="D"> <%= question.getOptionD() %></p>
            </div>
            <% } %>
            <input type="submit" value="Submit" class="submit-btn">
        </form>
    </div>
</body>
</html>