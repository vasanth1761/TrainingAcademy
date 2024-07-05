<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.chainsys.trainingacademy.model.Users"%>
!DOCTYPE html>
<html lang="en">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Four Cards in a Column</title>
<link rel="stylesheet" href="styles.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 400px;
    }

    .box {
        padding: 40px;
        height: 300px;
    }

    .card {
        width: 200px;
        height: 250px;
        padding: 20px;
        margin-top: 100px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: space-between; 
    }

    .card img {
        width: 200px;
        max-height: 200px; 
        margin-bottom: 10px; 
    }

    .card button {
        margin-top: 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .card button:hover {
        background-color: #0056b3;
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
        display: none;
        position: absolute;
        background-color: #fff;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        right: 0;
        top: 40px;
        min-width: 160px;
        border-radius: 8px;
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
</style>
</head>
<body>
<% Users userName = (Users) session.getAttribute("userId"); %>
<div class="navbar">
    <span>Course Dashboard</span>
    <div class="profile-section">
        <img src="image/profile.png" alt="User Symbol">
        <span class="username" id="username"><%= userName.getName()%></span>
        <div class="dropdown-content">
            <a href="#">Profile</a>
            <a href="#">Logout</a>
            
        </div>
    </div>
</div>

<div class="container">
    <form action="courseDetails" method="get">
        <div class="box">
            <div class="card">
                <img alt="Software Course" src="image/java.jpg">
                <input type="hidden" name="action" value="java">
                <button type="submit">Enroll</button>
            </div>
        </div>
    </form>
  
    <form action="courseDetails" method="get">
        <div class="box">
            <div class="card">
                <img alt="Business Course" src="image/html.png">
                <input type="hidden" name="action" value="html">
                <button type="submit">Enroll</button>
            </div>
        </div>
    </form>
  
    <form action="courseDetails" method="get">
        <div class="box">
            <div class="card">
                <img alt="Marketing Course" src="image/css.jpg">
                <input type="hidden" name="action" value="css">
                <button type="submit">Enroll</button>
            </div>
        </div>
    </form>
 
    <form action="courseDetails" method="get">
        <div class="box">
            <div class="card">
                <img alt="Finance Course" src="image/Angular.jpg">
                <input type="hidden" name="action" value="angular">
                <button type="submit">Enroll</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
  