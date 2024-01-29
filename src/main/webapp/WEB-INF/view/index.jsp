 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  
    <title>User Profile</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 1em;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th, td {
            padding: 8px 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
        
            background-color: #4a2739;
            color: #fff;
            font-size: x-large;
           
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        h1 {
            color: white;
            margin-bottom: 10px;
            border-bottom-color: purple;
        }
        a{
          color: white;
          text-decoration: none;
        }
        .add{
           display: flex;
           justify-content: flex-end;
          
        }
        
    </style>
</head>
<body>

<header>
    <h1>Users Profile</h1>
</header>

<table border="2">
    <tr>
        <th class="th1">Id</th>
        <th class="th1">Name</th>
        <th class="th1" >Email</th>
        <th> </th>
        <th><div class="add" >

<button type="button" class="btn btn-lg btn-success"><a  href="/addStudent/${stu.id}">Add Student</a></button>

</div> </th>
    </tr>

    <c:forEach var="stu" items="${students}">
        <tr>
            <td>${stu.id}</td>
            <td>${stu.name}</td>
            <td>${stu.email}</td>
            <td> <button type="button" class="btn btn-danger" ><a  href="/${stu.id}">Delete</a></button></td>
            <td><button type="button" class="btn btn-primary"><a  href="/editStudent/${stu.id}">Edit</a></button></td>
            
        </tr>
    </c:forEach>
</table>


</body>
</html>
 