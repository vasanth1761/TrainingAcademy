<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.chainsys.trainingacademy.model.Users"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <style>
        .card {
            border-radius: 10px;
            padding: 20px;
            width: 400px;
            margin: 50px auto;
            text-align: center;
            background-color: #f4f4f4;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); 
        }

        .big-text {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .emoji {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .content {
            font-size: 18px; 
            margin-bottom: 20px; 
        }

        .comment-box {
            width: 80%;
            height: 100px;
            margin: 20px auto;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
        }

        .button-container {
            text-align: center;
        }

        .button-container a {
            background-color: #0056b3; 
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px; 
        }

        .button-container a:hover {
            background-color: #003366; 
        }
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

    .dropdown-content {
        margin-top:60px;
        display: none;
       position: relative;
       top: -30px;
            position: absolute;
            background-color: white; 
            min-width: 160px;
            z-index: 1;
            border-radius: 10px;
            color: black; 
            box-shadow: #666 10px;

    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {
        background-color: #f1f1f1;
    }

    .profile-section:hover .dropdown-content {
        display: block;
    }
    
    .dropdown-content form {
        margin: 0;
    }

    .dropdown-content button {
        width: 100%;
        background-color: #ff4b4b;
        color: #fff;
        border: none;
        padding: 12px 16px;
        text-align: left;
        font-size: 16px;
        border-radius: 5px;
      
        transition: background-color 2s;
    }

    .dropdown-content button:hover {
        background-color: #d43f3f;
    }
    input[type="radio"] {
    
        
    </style>
</head>
<body>
<% Users userName = (Users) session.getAttribute("userId"); %>
<div class="navbar">
    <span>Systech</span>
    <div class="profile-section">
        <img src="image/profile.png" alt="User Symbol">
        <span class="username" id="username"><%= userName.getName() %></span>
        <div class="dropdown-content">
            <a href="welcome.jsp">Logout</a>
        
            
        </div>
    </div>
</div>
    <div class="card">
        <div class="big-text">Thank You</div>
        <div class="emoji"></div>
        <p class="content">Your feedback is highly appreciated!</p>
        <form action="/Comments" method="post">
            <textarea class="comment-box" name="comment" placeholder="Leave your comment here"></textarea>
            <div class="button-container">
                <input type="submit" value="Submit" class="logout-button">
                <a href="viewCourse.jsp" class="logout-button">Go Home</a> 
            </div>
        </form>
    </div>
</body>
</html>
