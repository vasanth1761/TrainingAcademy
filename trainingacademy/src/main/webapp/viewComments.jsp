<%@ page import="com.chainsys.trainingacademy.model.Comments" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Learner Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 70%; /* Adjusted table width */
            margin: 0 auto; /* Center align the table */
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #0056b3;
            color: #fff;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <h2>Learner Results</h2>
    <table>
        <thead>
            <tr>
                <th>Learner ID</th>
                <th>Learner Name</th>
                <th>Course Name</th>
                <th>Comments</th>
            </tr>
        </thead>
        <tbody>
            
            <%
            
            List<Comments> question = (List<Comments>) request.getAttribute("viewComments");
            %>
            
            <% for(Comments result : question) { %>
                <tr>
                    <td><%= result.getLearnerId() %></td>
                    <td><%= result.getLearnerName()%></td>
                    <td><%= result.getLearnerCourse()%></td>
                    <td><%= result.getLearnerComments() %></td>
      
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
