<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="updateVideo" method="post">

       <input type="text"name="title"placeholder="videoTitle"><br>
        <input type="text" name="video"placeholder="video"><br>
        <input type="hidden" name="action" value="update">
		<input type="hidden" name="updateId" value="<%=request.getParameter("updateid")%>">		
		<button type="submit" title="update">Update</button>
        </form>
       
</body>
</body>
</html>