<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
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
  background-color: #0056b3;}
 .google-btn {
  margin-top: 10px;
  width: 100%;
  max-width: 200px; /* Adjust the max-width */
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
 <div> 
<form action ="training" method="get">
 <h1>Login</h1>

 <input type="email"name="email"placeholder="Enter the Email"><br><br>
 <input type="password" name="password" placeholder="Password"pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#&]).{5,}"><br><br>

 <input type="hidden"  name="action" value="login"> 
 <button type="submit" >login</button>

 

 <center>
      <p>Don't have an account? <a href="Register.jsp">Click here</a></p>
 </center>  
</form>
</div>
  

</body>
</html>