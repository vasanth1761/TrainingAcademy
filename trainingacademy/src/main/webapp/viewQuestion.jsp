<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
<%@page import="com.chainsys.trainingacademy.model.Questions"%>


 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
  }
  
  h1 {
    text-align: center;
    margin-top: 20px;
    color: #333; 
  }

  table {
    width: 80%;
    margin: 50px auto;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
  }

  table th, table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
  }

  table th {
    background-color: #3498db; 
    color: white;
  }

  .formm td {
    background-color: #ecf0f1; 
    color: #333;    font-weight: bold;
  }

</style>
</head>
<body>
  <h1>Inserted Successfully</h1>
  <table>
    <thead>
      <tr class="formm">
        <th>Qno</th>
        <th>Question</th>
        <th>Option A</th>
        <th>Option B</th>
        <th>Option C</th>
        <th>Option D</th>
        <th>Correct Answer</th>
      </tr>
    </thead>
    <tbody>
      <% 
      List<Questions> questions = (List<Questions>) request.getAttribute("view");
      int i = 1;
      for (Questions question : questions) {
      %>
      <tr>
        <td><%= i++ %></td>
        <td><%= question.getQuestion() %></td>
        <td><%= question.getOptionA() %></td>
        <td><%= question.getOptionB() %></td>
        <td><%= question.getOptionC() %></td>
        <td><%= question.getOptionD() %></td>
        <td><%= question.getCorrectAnswer() %></td>
      </tr>
      <% } %>
    </tbody>
  </table>
</body>
</html>
