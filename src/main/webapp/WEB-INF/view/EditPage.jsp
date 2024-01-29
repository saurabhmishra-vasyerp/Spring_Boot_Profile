<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


<style>
.container{
  justify-content: centre;
  
}
</style>
</head>
<body>
  <div class="container">
  <form action="/EditPage" method="post">
   
  <div class="mb-3">
    <input type="hidden" class="form-control" id="myid" name="id" value="${student.id}">
    

  </div>
  <div class="mb-3">
    <label  class="form-label">Name:</label>
    <input type="text" class="form-control" id="myid" name="name" value="${student.name}" >

  </div>
  <div class="mb-3">
    <label class="form-label">Email:</label>
    <input type="email" class="form-control" id="myid" name="email" value="${student.email}" >
  </div>
 
  <button type="submit" class="btn btn-success">Submit</button>
</form>
  </div> 
   

</body>
</html>