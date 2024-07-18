
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Vasanth</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #0056b3; 
            padding: 10px 20px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
        }

        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #0056b3; 
            padding-top: 20px;
            transition: width 0.3s; 
        }

        .sidebar h2 {
            color: #fff;
            text-align: center;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 10px;
        }

        .sidebar ul li a {
            display: block;
            color: #fff;
            text-decoration: none;
            padding: 10px;
            transition: 0.3s;
        }

        .sidebar ul li a:hover {
            background-color: #007bff; 
        }

        .content {
            display: flex;
            justify-content: space-between;
            margin-left: 250px; 
            padding: 20px;
        }

        .card {
            flex: 1; 
            background-color: #f2f2f2; 
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
            cursor: pointer;
            transition: transform 0.3s ease;
            width: 10px; 
            height: 100px; 
            text-align: center;
            margin-left: 10px; 
            margin-right: 10px; 
        }
        

        .card:hover {
            transform: scale(1.02);
        }

        .card-title {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
        }

        .card-description {
            font-size: 14px;
            color: #666;
        }
        h1{
        margin-left:300px;
        }
    </style>
</head>
<body>


<div class="sidebar">
    <h2>Systech</h2>
    <ul>
 
        <li><a href="home.html"><i class="fa-solid fa-house"></i> Home</a></li>
        <li><a href="addQuestions.jsp"><i class="fa-solid fa-plus"style=color:white;></i>Add Question</a></li>
        <li><a href="addVideo.jsp"><i class="fa-solid fa-plus"style=color:white;></i>Add Video</a></li>
        <li><a href="viewVideos"><i class="fa-solid fa-eye"style=color:white;></i>View videos</a></li>
        <li><a href="viewQuestions"><i class="fa-solid fa-eye"style=color:white;></i>View questions</a></li>
        <li><a href="addCourse.jsp"><i class="fa-solid fa-plus"style=color:white;></i>AddCourse</a></li>
        <li><a href="welcome.jsp"><i class="fa-solid fa-right-to-bracket"style=color:white;></i>Logout</a></li>
        
    </ul>
</div>
<div>
   <h1>Welcome vasanth!!</h1><br><br>
   </div>
  

<div class="content">

  
    <div class="card" onclick="location.href='viewResult';">
        <div class="card-title">
        <br>
        <i class="fa-solid fa-users fa-2xl"></i><br><br>
            Learners Result
        </div>
    
    
        
    </div>
    <div class="card" onclick="location.href='viewComments';">
    <br>
        <div class="card-title">
        <i class="fa-solid fa-comment fa-2xl"></i><br><br>
            Comments
        </div>
        
        
    </div>
    <div class="card" onclick="location.href='viewResult';">
    <br>
        <div class="card-title">
        <i class="fa-solid fa-credit-card fa-2xl"></i><br><br>
            Payments
        </div>
</div>

</body>
</html>
