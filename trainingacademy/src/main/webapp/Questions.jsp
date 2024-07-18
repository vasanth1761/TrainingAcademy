<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.trainingacademy.model.Questions" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Question List</title> 
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
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
        .formm {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
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
    <h1 style="text-align: center;">Question List</h1>
    
    <div class="search-form">
        <form action="/searchQuestions" method="post">
            <input type="hidden" name="action" value="search">
            <input type="text" name="searchname" placeholder="Enter the course name">
            <button type="submit">Search</button>
        </form>
    </div>
    
    <table>
        <tr class="formm">
            <th>Qno</th>
            <th>Question</th>
            <th>Option A</th>
            <th>Option B</th>
            <th>Option C</th>
            <th>Option D</th>
            <th>Correct Answer</th> 
            <th>Course Name</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <%
        List<Questions> questions = (List<Questions>) request.getAttribute("viewAllQuestions");
		
		int i = 1;
		for (Questions question : questions) {
        %>
        <tr>
            <td><%= i++ %></td>
            <td><%= question.getQuestion()%></td>
            <td><%= question.getOptionA() %></td>
            <td><%= question.getOptionB() %></td>
            <td><%= question.getOptionC() %></td>
            <td><%= question.getOptionD() %></td>
            <td><%= question.getCorrectAnswer() %></td>
            <td><%= question.getCourse() %></td>
            <td>
			
			<input type="hidden" name="updateid" value="<%=question.getId() %>">
			<button type="submit" title="delete" onclick="location.href='updateQuestion.jsp?updateid=<%= question.getId() %> '">Update</button>
			
			</td>
			<td>
			<form action="alterQuestions" method="post">
			<input type="hidden" name="action" value="Delete">
			<input type="hidden" name="deleteId" value=<%=question.getId()%>>
			<button type="submit" title="delete">Delete</button>
			</td>
			</form>
        </tr>
        <% } %>
    </table>
</body>
</html>
