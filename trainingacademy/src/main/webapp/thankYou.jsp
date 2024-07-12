<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <style>
        .card {
            border-radius: 10px;
            padding: 20px;
            width: 400px;
            margin: 50px auto;
            text-align: center;
            background-color: #f4f4f4;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); 
        }

        .big-text {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .emoji {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .content {
            font-size: 18px; 
            margin-bottom: 20px; 
        }

        .comment-box {
            width: 80%;
            height: 100px;
            margin: 20px auto;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
        }

        .button-container {
            text-align: center;
        }

        .button-container a {
            background-color: #0056b3; 
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px; 
        }

        .button-container a:hover {
            background-color: #003366; 
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="big-text">Thank You</div>
        <div class="emoji"></div>
        <p class="content">Your feedback is highly appreciated!</p>
        <form action="/Comments" method="post">
            <textarea class="comment-box" name="comment" placeholder="Leave your comment here"></textarea>
            <div class="button-container">
                <input type="submit" value="Submit" class="logout-button">
                <!-- <a href="Home.jsp" class="logout-button">Logout</a>
 -->                <!-- <a href="course.jsp" class="logout-button">Add course</a> -->
            </div>
        </form>
    </div>
</body>
</html>
