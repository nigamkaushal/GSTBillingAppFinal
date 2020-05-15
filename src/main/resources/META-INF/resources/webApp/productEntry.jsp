
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<title>Product Entry Page</title>
</head>
<body>
	<h3>Add or Update Products</h3>
	<form action="form1" method="post">
		<table class="table table-dark">
			<tr>
				<td>Product Code :</td>
				<td><input type="text" name="product_code" /></td>
			</tr>
			<tr>
				<td>Product Name :</td>
				<td><input type="text" name="product_name" /></td>
			</tr>
			<tr>
				<td>Product Price :</td>
				<td><input type="text" name="product_price" /></td>
			</tr>
			<tr>
				<td>Product GST% :</td>
				<td><input type="text" name="product_gst" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="add" value="Add" /></td>
				<td><input type="submit" name="update" value="Update" /></td>
			</tr>
		</table>
	</form>
		
	<h3>Existing Products</h3>
	<table class="table table-bordered table-dark" border="1">
			<th>Product Code</th>
			<th>Product Name</th>
			<th>Product Price</th>
			<th>Product GST%</th>
			<c:forEach var="prod" items="${command}" > 
			    <tr>
				    <td>${prod.product_code}</td>
				    <td>${prod.product_name}</td>
				    <td>${prod.product_price}</td>
				    <td>${prod.product_gst}</td>
			    </tr>
		    </c:forEach>
	</table>
	<a href="/home"><button class="btn btn-primary"> Go to Billing Page</button></a>
</body>
</html>