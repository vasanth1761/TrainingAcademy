<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Course</title>
<style>
body {
    background-image: url("register.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

h2 {
    text-align: center;
    color: #007bff; /* Blue color for the heading */
    margin-top: 20px; /* Add some spacing from the top */
}

form {
    max-width: 500px;
    margin: 20px auto; /* Center align the form with some margin */
    background-color: #ffffff; /* White background */
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); /* Soft shadow effect */
}

form label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

form input[type="text"],
form textarea,
form input[type="file"] {
    width: calc(100% - 22px); /* Adjusting width to fit inside padding */
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #cccccc; /* Light gray border */
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 16px;
}

form textarea {
    height: 100px;
    resize: none;
}

form input[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #007bff; /* Blue button */
    color: #ffffff; /* White text */
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    font-size: 16px;
}

form input[type="submit"]:hover {
    background-color: #0056b3; /* Darker blue on hover */
}

/* Custom styling for the file input */
form input[type="file"] {
    padding: 10px;
    background-color: #f0f0f0; /* Light gray background for file input */
    border: 1px solid #cccccc;
    border-radius: 5px;
}

/* Additional styles for better form appearance */
form input[type="text"],
form textarea,
form input[type="file"],
form input[type="submit"] {
    transition: border-color 0.3s ease;
}

form input[type="text"]:focus,
form textarea:focus,
form input[type="file"]:focus {
    outline: none;
    border-color: #007bff; /* Blue outline on focus */
}
</style>
</head>
<body>
    <h2>Add Course</h2>
    <form action="/course" method="post" enctype="multipart/form-data">
        <label for="coursename">Course Name:</label>
        <input type="text" id="coursename" name="coursename" required><br><br>
        
        <label for="coursetype">Course Type:</label>
        <input type="text" id="coursetype" name="coursetype" required><br><br>
        
        <label for="courseimage">Course Image:</label>
        <input type="file" id="courseimage" name="filePart" accept="image/*" required><br><br>
        
        <label for="amount">Amount:</label>
        <input type="text" id="amount" name="amount" required><br><br>
        
        <button type="submit">Add Course</button>
    </form>
</body>
</html>
