<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chainsys.trainingacademy.model.Course"%>
<%@ page import="com.chainsys.trainingacademy.model.Users"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Category Details</title>
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

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    max-width: 1000px; 
    margin: 100px auto 0 auto; /* Adjusted margin for better layout */
}

h1 {
    color: #4CAF50;
    text-shadow: 2px 2px 4px violet;
    text-decoration: underline;
    text-align: center;
    margin-top: 0;
    padding-top: 20px;
    width: 100%;
    box-sizing: border-box;
}

.card {
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    color: black;
    margin: 20px;
    border-radius: 8px;
    overflow: hidden;
    max-width: 300px;
    width: calc(50% - 40px); 
    flex: 1 0 auto;
    box-sizing: border-box;
}

.card-header {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    text-align: center;
}

.card-body {
    padding: 0px;
    text-align: center;
}

.card-body img {
    width: 100%;
    height: 100%;
    display: block;
    margin: 0 auto;
    border-radius: 5px;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
    object-fit: cover; 
}

.button-style {
    background-color: #0056b3; 
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.button-style:hover {
    background-color: #4CAF50;
}
</style>
</head>
<body>
<% Users userName = (Users) session.getAttribute("userId"); %>
<div class="navbar">
    <span>Systech</span>
    <div class="profile-section">
        <img src="image/profile.png" alt="Profile Picture">
        <span class="username" id="username"><%= userName.getName()%></span>
       
    </div>
</div>

<div class="container">
    <% List<Course> courses = (List<Course>) request.getAttribute("viewCourse");
       for (Course course : courses) { %>
           <div class="card">
               <div class="card-body">
                   <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(course.getCourseImage()) %>" alt="Course Image" />
                   <h2><%= course.getCourseName() %></h2>
                   <form action="/selectedCourse" method="post">
                       <input type="hidden" name="courseid" value="<%= course.getCourseId() %>">
                       <input type="hidden" name="coursename" value="<%= course.getCourseName() %>">
                       <input type="hidden" name="courseamount" value="<%= course.getAmount() %>">
                       <button class="button-style" type="submit">₹<%= course.getAmount() %></button>
                   </form>
               </div>
           </div>
       <% } %>
</div>
</body>
</html>
