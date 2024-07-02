<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.chainsys.trainingacademy.model.Videos"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Videos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border: 1px solid #ddd;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        iframe {
            width: 100%;
            height: 200px;
        }
        .video-title {
            max-width: 200px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .video-category {
            font-weight: bold;
            color: #007bff;
        }
        .search-form {
            margin-bottom: 20px;
        }
        .search-form input[type="text"] {
            padding: 8px;
            border: 1px solid #ddd;
            font-size: 14px;
        }
        .search-form button {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <h1>Inserted Successfully</h1>
    

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Video</th>
                <th>Course</th>
                
            </tr>
        </thead>
        <tbody>
            <% List<Videos> videos = (List<Videos>) request.getAttribute("video"); 
            for (Videos video : videos) { %>
            <tr>
                <td class="video-category"><%=video.getTitle() %></td>
                <td class="video-title"><%= video.getLink()%></td>
                <td><iframe src="<%=video.getCategory()%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></td>
               <td>
			 
			
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>