
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
	background-image:
		url("https://img.freepik.com/free-vector/blue-white-gradient-abstract-background_53876-62183.jpg?size=626&ext=jpg&ga=GA1.1.1673116259.1706070178&semt=ais");
	font-family: 'Arial', sans-serif;
	background-repeat: no-repeat;
	background-color: #FFE7C1; background-size : cover;
	margin: 0;
	padding: 0;
	background-size: cover;
}

header {
	font-family: Georgia, serif;
	text-decoration: underline;
	color: #0C2D57;
	padding: 1em;
	font-weight: bold;
	text-align: center;
	display: grid;
}

table {
	width: 80%;
	margin: 1px auto;
	border: 1px solid black;
	border-collapse: collapse;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	background-color: #F3F8FF;
}

th, td {
	padding: 8px 10px;
	text-align: left;
	text-align: center;
	vertical-align: middle;
	border: 1px solid blue;
}

th {
	background-color: #164863;
	color: #fff;
	font-size: x-large;
}

tr:hover {
	background-color: #f5f5f5;
}

tr {
	text-align: center;
	border: 1px solid blue;
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

.buttons button{
	margin:0px 15px;
	
}

.add {
	display: flex;
	flex-direction: row-reverse;
	margin-right: 152px;
}

.th1 {
	text-align: center;
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

	<div class="add">

		<button type="button" class="btn btn-lg btn-success">
			<a href="#addStudentModal" data-toggle="modal"> Add Student</a>
		</button>

	</div>

	<table>
		<tr >
			<th class="th1">Id</th>
			<th class="th1">Name</th>
			<th class="th1">Email</th>
			<th class="th1">Action</th>

		</tr>

		<c:forEach var="stu" items="${students}">
			<tr>
				<td>${stu.id}</td>
				<td>${stu.name}</td>
				<td>${stu.email}</td>
				<td class="buttons">

					<button type="button" class="btn btn-secondary">
						<a href="#viewStudentModal" data-toggle="modal"
							onclick="viewStudent(${stu.id})">View</a>

					</button>
					<button type="button" class="btn btn-primary">
						<a href="#editStudentModal" data-toggle="modal"
							onclick="edtStudent(${stu.id})"> Edit</a>
					</button>
					<button type="button" class="btn btn-danger">
						<a href="/${stu.id}"> Delete</a>
					</button>

				</td>


			</tr>
		</c:forEach>
	</table>


	<!-- Edit Modal HTML -->
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
								id="email" name="email" required>
						</div>

						<div class="form-group">
							<label>Gender</label> <input type="text" class="form-control"
								id="gender" name="gender" required>
						</div>

						<div class="form-group">
							<label>Address</label> <input type="text" class="form-control"
								id="address" name="address" required>
						</div>
						<div class="form-group">
							<label>Phone</label> <input type="text" class="form-control"
								id="phone" name="phone" required>
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
						<div class="form-group">
							<label>Gender</label> <input type="text" class="form-control"
								name="gender" required>
						</div>
						<div class="form-group">
							<label>Address</label> <input type="text" class="form-control"
								name="address" required>
						</div>
						<div class="form-group">
							<label>Phone</label> <input type="text" class="form-control"
								name="phone" required>
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

	<!-- View Modal HTML -->

	<div id="viewStudentModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title">Student Details</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						Name: &nbsp;<label id="stuName"></label>
					</div>
					<div class="form-group">
						Email: &nbsp;<label id="stuemail"></label>
					</div>
					<div class="form-group">
						Gender: &nbsp;<label id="stugender"></label>
					</div>
					<div class="form-group">
						Address: &nbsp;<label id="stuaddress"></label>
					</div>
					<div class="form-group">
						Phone: &nbsp;<label id="stuphone"></label>
					</div>

				</div>
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
		function edtStudent(id){
			$.ajax({
				type : 'GET',
				url : '/getid/' + id,
				success : function(response) {
					
					$('#id').val(response.id);
					$('#name').val(response.name);
					$('#email').val(response.email);
					$('#gender').val(response.gender);
					$('#address').val(response.address);
					$('#phone').val(response.phone);
					$('#editStudentModal').modal('show');
				},
				error : function(error) {
					console.error('Error fetching student data: ', error);
				}
			});
		}
		
		function viewStudent(id) {
			$.ajax({
				type : 'GET',
				url : '/getid/' + id,
				success : function(response) {
					console.log(response);
					$('#stuid').html(response.id);
					$('#stuName').html(response.name);
					$('#stuemail').html(response.email);
					$('#stugender').html(response.gender);
					$('#stuaddress').html(response.address);
					$('#stuphone').html(response.phone);
					$('#viewStudentModal').modal('show');
				},
				error : function(error) {
					console.error('Error showing student data: ', error);
				}
			});
		}
	</script>
</body>
</html>
