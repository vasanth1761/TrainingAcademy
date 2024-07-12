<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.1.6/sweetalert2.min.css">
</head>
<style>
body {
  font-family: Arial, sans-serif;
  background-image: url('loginbackground.jpeg');
  background-size: cover;
  background-position: center;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

h1 {
  text-align: center;
  margin-top:10px;
}

form {
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  max-width: 300px;
  width: 100%;
}

input[type="text"],
input[type="email"],
input[type="password"] {
  width: calc(100% - 20px);
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

button[type="submit"] {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button[type="submit"]:hover {
  background-color: #0056b3;
}
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
            const errorMessage = '<%= request.getAttribute("errorMessage") %>';
            if (errorMessage && errorMessage !== 'null') {
                alert(errorMessage);
            }
        });
 </script>   
<body>
<div>
<% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
    <% } %>
<form id="registerForm" action="/register" method="post">
 <h1>REGISTER</h1>
 <input type="text" name="name" placeholder="Enter the name"  required><br><br>
 <input type="email" name="email" placeholder="Enter the Email"required><br><br>
 <input type="text" name="number" placeholder="Mobile" pattern="[0-9]{10}"required><br><br>
 <input type="password" name="password" placeholder="Password"pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#&]).{5,}"required><br><br>
 <input type="hidden" name="action" value="register"> 
 <button type="submit">Submit</button>
 <p>Already have an account?</p>
 <center>
 <a href="landingpage.jsp">Click here</a>
 </center>
</form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.1.6/sweetalert2.min.js"></script>
<script>
$(document).ready(function(){
    $('#registerForm').submit(function(e){
        e.preventDefault(); // Prevent form submission
        // Simulate account creation success (replace this with your actual logic)
        // Assuming this script runs after the form submission and the account is created successfully
        // You may need to adjust this based on your backend logic
        Swal.fire({
            icon: 'success',
            title: 'Account Created Successfully',
            text: 'Your account has been successfully created.',
            showConfirmButton: false,
            timer: 2000, // Change the duration (in milliseconds) as needed
            timerProgressBar: true // Show timer progress bar
        }).then(function() {
            // Redirect to the landing page after the SweetAlert message disappears
            window.location.href = 'landingpage.jsp';
        });
    });
});
</script> 
</body>
</html>
