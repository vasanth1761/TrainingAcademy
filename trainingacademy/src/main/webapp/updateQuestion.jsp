<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Update Questions</title> 
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f5f9; 
        margin: 0;
        padding: 20px;
    }

    form {
        max-width: 400px;
        margin: 0 auto;
        background-color: #ffffff; 
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
    }

    input[type="text"], button {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd; 
        border-radius: 4px;
        box-sizing: border-box; 
        font-size: 16px;
    }

    input[type="text"]:focus {
        outline: none;
        border-color: #4e7dfe; 
        box-shadow: 0 0 5px rgba(78, 125, 254, 0.5); 
    }

    button {
        background-color: #4e7dfe; 
        color: white;
        border: none;
        cursor: pointer;
        font-size: 16px;
        padding: 12px 0;
        transition: background-color 0.3s;
    }

    button:hover {
        background-color: #3366cc; 
    }
</style>
</head>
<body>
<center>
<h1><strong>Update Questions</strong></h1>
</center>
<form action="alterUpdateQuestions" method="post">
    <input type="text" name="Question" placeholder="Question"><br>
    <input type="text" name="OptionA" placeholder="Option A"><br>
    <input type="text" name="OptionB" placeholder="Option B"><br>
    <input type="text" name="OptionC" placeholder="Option C"><br>
    <input type="text" name="OptionD" placeholder="Option D"><br>
    <input type="text" name="CorrectAnswer" placeholder="Correct Answer"><br>
    
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="updateid" value="<%= request.getParameter("updateid") %>">
    <button type="submit" title="Update">Update</button>
</form>
</body>
</html>
