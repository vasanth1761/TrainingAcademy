<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.chainsys.trainingacademy.model.Users" %>
<!DOCTYPE>
<html>
<head>
    <title>Result</title>
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
       
        table {
            width: 50%;
            margin: auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        
        .certificate-button {
            background-color: blue;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-align: center;
            display: block;
            margin: 20px auto;
            cursor: pointer;
        }
    </style>
</head>
<script>
document.addEventListener("DOMContentLoaded", function() {
            const errorMessage = '<%= request.getAttribute("errorMessage") %>';
            if (errorMessage && errorMessage !== 'null') {
                alert(errorMessage);
            }
        });
 </script>  
<body>
<div></div>
<% Users userName = (Users) session.getAttribute("userId"); %>
<div class="navbar">
    <span>Systech</span>
    <div class="profile-section">
        <img src="image/profile.png" alt="User Symbol">
        <span class="username" id="username"><%= userName.getName()%></span>
        
    </div>
    </div>
    <br>
    <br>
    <br>

    <center><h2><strong>Result</h2></strong></center>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Total Questions </th>
            <th>Correct Answers</th>
            <th>Percentage</th>
        </tr>
        <tr>
            <td><%= request.getAttribute("name") %></td>
            <td><%= request.getAttribute("totalCount") %></td>
            <td><%= request.getAttribute("correctCount") %></td>
            <td><%= request.getAttribute("percentage") %>%</td>
        </tr>
    </table>
    
    <form action="/PercentageVerification" method="post" id="certificateForm">
        <input type="hidden" name="percentage" value="<%= request.getAttribute("percentage") %>">
        <button type="submit" class="certificate-button">Generate Certificate</button>
    </form>

    
    <script>
        document.querySelector('.certificate-button').addEventListener('click', function() {
            document.getElementById('certificateForm').submit();
        });
    </script> 
</body>
</html>
  