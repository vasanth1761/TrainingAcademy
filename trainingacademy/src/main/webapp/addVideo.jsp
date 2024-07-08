<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Add Video</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    h1 {
        text-align: center;
        margin-top: 50px;
    }
    form {
        width: 400px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    label {
        font-weight: bold;
    }
    input[type="text"] {
        width: calc(100% - 20px);
        padding: 8px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    select {
        width: calc(100% - 20px);
        padding: 8px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        width: 100%;
        background-color:blue;
        color: white;
        padding: 10px 0;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<h1>Add Video</h1>
<form action="addVideo" method="post">
    <label for="title">Video Title:</label><br>
    <input type="text" id="title" name="title" required><br>

    <label for="link">Video Link:</label><br>
    <input type="text" id="link" name="link" required><br>

    <label for="category">Category:</label><br>
    <input type="text"id="category"name="category"required><br>

    <label for="type">Type:</label><br>
    <select id="type" name="type" required>
        <option value="">Select Type</option>
        <option value="free">Free Module</option>
        <option value="notfree">Paid Module</option>
    </select><br>

    <input type="submit" value="Submit">
</form>
</body>
</html>
