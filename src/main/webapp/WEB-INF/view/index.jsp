
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>User Profile</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

header {
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
	font-weight: bold;
	margin-top: 40px;
	color: #4a2739;
	margin-bottom: 10px;
	border-bottom-color: purple;
}

a {
	color: white;
	text-decoration: none;
}

.add {
	display: flex;
	justify-content: flex-end;
}
</style>
<script>
	$(document).ready(function() {
		// Activate tooltip
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
</head>
<body>

	<header>
		<h1>Users Profile</h1>
	</header>

	<table border="2">
		<tr>
			<th class="th1">Id</th>
			<th class="th1">Name</th>
			<th class="th1">Email</th>
			<th></th>
			<th><div class="add">

					<button type="button" class="btn btn-lg btn-success">
						<a href="#addStudentModal" data-toggle="modal"> Add Student</a>
					</button>

				</div></th>
		</tr>

		<c:forEach var="stu" items="${students}">
			<tr>
				<td>${stu.id}</td>
				<td>${stu.name}</td>
				<td>${stu.email}</td>
				<td>
					<button type="button" class="btn btn-danger">
						<a href="/${stu.id}">Delete</a>
					</button>
				</td>
				<td><button type="button" class="btn btn-primary">
						<a href="#editStudentModal" data-toggle="modal" onclick="edtStudent(${stu.id})">Edit</a></button></td>

			 </tr>
		</c:forEach>
	</table>

	<div id="editStudentModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/addStudent" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Edit Student</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input id="id" name="id" type="hidden" class="form-control"
								required>
						</div>
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								id="name" name="name" required>
						</div>
						<div class="form-group">
							<label>Email</label> <input type="email" class="form-control"
								id="email" name="email"required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit" class="btn btn-info"
							value="Save">

					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Add Modal HTML -->
	<div id="addStudentModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/addStudent" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Add Student</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								name="name" required>
						</div>
						<div class="form-group">
							<label>Email</label> <input type="email" class="form-control"
								name="email" required>
						</div>

					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- Include jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<!-- Include Bootstrap JS (Popper.js is required for Bootstrap) -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function edtStudent(id) {
			$.ajax({
				type : 'GET',
				url : '/getid/' + id,
				success : function(response) {
					$('#id').val(response.id);
					$('#name').val(response.name);
					$('#email').val(response.email);
					$('#editStudentModal').modal('show');
				},
				error : function(error) {
					console.error('Error fetching student data: ', error);
				}
			});
		}
	</script>
</body>
</html>
