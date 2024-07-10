<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sorry</title>
    <style>
        .card {
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            margin: 50px auto;
            text-align: center;
            background-color: #f4f4f4; 
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }

        .big-text {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .emoji {
            font-size: 64px;
            margin-bottom: 20px;
        }

        .continue-button {
            background-color: #0056b3; 
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
        }

        .continue-button:hover {
            background-color: #003366; 
        }

        .content {
            font-size: 18px; 
            margin-bottom: 20px; 
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
<form action="/getQuestion">
    <div class="card">
        <div class="big-text">Sorry</div>
        <div class="emoji"></div>
        <p class="content">Sorry, you don't have enough marks to get the certificate.Take Retest</p>
       
        <button class="continue-button">Continue</button>
    </div>
    </form>
</body>
</html>