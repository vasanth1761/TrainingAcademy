<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Successful</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<style>
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; 
}

.content-box {
    background-color: #f5f5f5;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
}

.payment-success {
    margin-bottom: 20px;
}

.success-icon {
    color: #28a745; 
}

.proceed-button {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s;
}

.proceed-button:hover {
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
<form action="/selectedCourseVideos" method="post">
<div class="container">
    <div class="content-box">
        <div class="payment-success">
            <i class="fas fa-check-circle fa-5x success-icon"></i>
            <h2>Payment Successful</h2>
        </div>
        <button class="proceed-button">Proceed</button>
    </div>
</div>
</form>

</body>
</html>


</body>
</html>