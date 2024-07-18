<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation Bar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        nav {
            background-color: #2A73CC; 
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
        }
        nav h1 {
            margin: 0;
            font-size: 24px;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }
        nav ul li {
            margin-right: 30px;
        }
        nav ul li:last-child {
            margin-right: 0;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 15px;
        }
        nav ul li a:hover {
            text-decoration: underline;
        }
        .search-bar {
            display: flex;
            align-items: center;
        }
        .search-bar input[type="text"] {
            padding: 8px;
            border-radius: 10px;
            border: 1px solid #ccc;
            margin-left: 2px;
        }
        .search-bar button {
            padding: 8px 16px;
            background-color: #666;
            color: #fff;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            margin-left: 10px;
            font-size: 16px;
        }
        /* Dropdown */
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
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
            color: blue;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .second-nav {
            background-color: #333;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px 40px;
        }
        .second-nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }
        .second-nav ul li {
            margin-right: 20px;
        }
        .second-nav ul li:last-child {
            margin-right: 0;
        }
        .second-nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }
        .second-nav ul li a:hover {
            text-decoration: underline;
        }
        .center-content img {
            position: absolute;
            left: 0;
            top: 0;
            height: 70%;
            width: 50%;
            z-index: -1;
            margin-left: 50%;
            margin-top: 10%;
        }
        .center-content h1 {
            font-size: 50px;
            margin-left:25px;
        }
        .content p {
            font-size: 20px; 
            margin-top: 20px;
            margin-left:25px ;
        }
        .content button {
            padding: 14px 44px; 
            background-color: #2A73CC;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            align-self: center; 
            margin-left: 250px;
        }
        .content button:hover {
            color: black; 
        }
        
    </style>
</head>
<body>
    <nav>
        <h1>Systech</h1>
        <div class="dropdown">
            <p class="dropbtn">Categories</p>
            <div class="dropdown-content">
                <a href="#">Development</a>
                <a href="#">Business</a>
                <a href="#">Finance & Accounting</a>
                <a href="#">Personal Development</a>
                <a href="#">Design</a>
                <a href="#">Marketing</a>
            </div>
        </div>
       
       
        <ul>

            <li><a href="#"><i class="fas fa-info-circle"></i>About us</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Sign Up</a></li>
        </ul>
    </nav>

    
    <div class="second-nav">
        <ul>
            <li><a href="#">Development</a></li>
            <li><a href="#">Business</a></li>
            <li><a href="#">Finance & Accounting</a></li>
            <li><a href="#">Personal Development</a></li>
            <li><a href="#">Design</a></li>
            <li><a href="#">Marketing</a></li>
        </ul>
    </div>

    <div class="center-content">
        <h1>Learn without Limits...</h1>
        <img src="image/homebackground.jpg" alt="Background ">
    </div>
    <div class="content">
        <p>Professional Certificates offer flexible, online training designed <br><br>
             to get you job-ready for high-growth fields.</p>
             <form action="login.jsp">
             <button>Enroll</button>
            </form>
    </div>

</body>
</html>
        