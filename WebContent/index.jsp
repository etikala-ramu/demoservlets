<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.crud.dao.BookDao,com.crud.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>JSP CRUD</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href='style.css'></link>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- 	<style>
	.button {
    margin:auto;
  display:block;;
}
	</style> -->
</head>
<body>
	<div class="container bg-light text-dark">
		<h1>JSP CRUD</h1>
		<div class=row>
			<div class='col-md-4'></div>
			<div class='col-md-4'>
				<form action="addbook.jsp" method="post">
					<div class='row' class="form-group">
						<div class='col-md-4'>Book Id</div>
						<div class='col-md-6'>
							<input type="text" class="form-control" name="bookid" />
						</div>
					</div>
					<div class='row' class="form-group">
						<div class='col-md-4'>Book Name</div>
						<div class='col-md-6'>
							<input type="text" class="form-control" name="bookname" />
						</div>
					</div>
					<div class='row' class="form-group">
						<div class='col-md-4'>Book Author</div>
						<div class='col-md-6'>
							<input type="text" class="form-control" name="bookauthor" />
						</div>
					</div>
					<br>
					<!-- 					<button class='btn btn-info' input type="submit"
						value="Add Book">submit</button> -->
					<div class='row'>
						<button type="button" class="btn btn-info ramu-btn">Submit</button>
					</div>
					<!-- <table>
					<tr>
						<td>Bookid:</td>
						<td><input type="text" name="bookid" /></td>
					</tr>
					<tr>
						<td>Bookname:</td>
						<td><input type="text" name="bookname" /></td>
					</tr>
					<tr>
						<td>Bookauthor:</td>
						<td><input type="text" name="bookauthor" /></td>
					</tr>
					<tr>
						<td><button class='btn btn-success' input type="submit" value="Add Book">submit</button></td>
					</tr>
				</table>
 -->
				</form>
			</div>
			<div class='col-md-4'></div>
		</div>
		<!-- 	<div class='row'>
		<h1>Add New Book</h1>

		<form action="addbook.jsp" method="post">

			<table>

				<tr>
					<td>Bookid:</td>
					<td><input type="text" name="bookid" /></td>
				</tr>
				<tr>
					<td>Bookname:</td>
					<td><input type="text" name="bookname" /></td>
				</tr>
				<tr>
					<td>Bookauthor:</td>
					<td><input type="text" name="bookauthor" /></td>
				</tr>
				<tr>
					<td><button input type="submit" value="Add Book">submit</button></td>
				</tr>
			</table>
		</form>
	</div> -->
		<div class='row'>
			<div class='col-md-6'>
				<h1>Book List</h1>
				<%
					List<Book> list = BookDao.getAllRecords();
					request.setAttribute("list", list);
				%>
				<table class="table table-striped">
					<tr>
						<th>Bookid</th>
						<th>Bookname</th>
						<th>Bookauthor</th>
						<th>Actions</th>
					</tr>
					<c:forEach items="${list}" var="b">
						<tr>
							<td>${b.getBookid()}</td>
							<td>${b.getBookname()}</td>
							<td>${b.getBookauthor()}</td>

							<td><a href="editform.jsp?bookid=${b.getBookid()}"
								class="btn btn-success">Edit</a></td>
							<td><a href="deletebook.jsp?bookid=${b.getBookid()}"
								class="btn btn-danger">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class='col-md-6'>
				<h1>Search Book</h1>
				<form action="editform.jsp">
					<input type='text' placeholder="enter Book id" name='bookid'>
					<button  class='btn btn-info'>Search</button>
				</form>
				
			</div>
		</div>
		<!-- <a href="addbookform.jsp">Add User</a>  
<a href="viewbook.jsp">View Users</a> -->


	</div>

</body>
</html>