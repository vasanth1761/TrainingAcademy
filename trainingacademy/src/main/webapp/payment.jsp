<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.chainsys.trainingacademy.model.Users"%>
<%@page import="com.chainsys.trainingacademy.model.Course"%>

    
<!DOCTYPE>    
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Page</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    padding: 20px;
  }
  
  h2 {
    text-align: center;
    color: #333;
  }
  
  form {
    max-width: 400px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  
  label {
    font-weight: bold;
    color: #333;
  }
  
  input[type="text"],
  select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
  }
  
  input[type="submit"] {
    background-color: blue; 
    color: white;
    padding: 8px 12px; 
    margin-top: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 30%;
    font-size: 14px; 
    margin-left:130px;
  }
  
  input[type="submit"]:hover {
    background-color: #0066cc; 
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
</style>
</head>
<body>
<% Users getName = (Users) session.getAttribute("userId"); %> 

 <%Course getCourseName=(Course)session.getAttribute("course"); %>
 
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

<h2>Payment</h2>

<form action="paymentCard.jsp">
  <label for="learner_name">Learner Name:</label>
  <input type="text" id="learner_name" name="learner_name" value="<%=getName.getName() %>" required>
  
  <label for="learner_name">Selected Course:</label>
  <input type="text" id="learner_name" name="learner_name" value="<%=getCourseName.getCourseName() %>"  required>
  
  <label for="learner_name">Total Amount:</label>
  <input type="text" id="learner_name" name="learner_name" value="<%=getCourseName.getAmount() %>" required>
  
 
  <input type="submit" name="pay"value="Pay">
</form>

</body>
</html>
