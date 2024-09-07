<%@page import="com.MainApp.Pojo.AddressAndProductInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.MainApp.Pojo.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#pbox{
		display: none;
		position: absolute;
	}
	#ptable{
	display:none;
	}
	#ctable{
	display: none;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="text-center bg-dark">
<img alt="logo" src="images/logo.png" style="height:100px ">
</div>
<%
String check = (String)request.getAttribute("check");
String msg = (String)request.getAttribute("msg");
if(check!=null){
	List<Products> pl = (List<Products>)request.getAttribute("pl");	
	List<AddressAndProductInfo> apil = (List<AddressAndProductInfo>)request.getAttribute("apil");
%>
<h1 class="text-center">WelCome <%=check%></h1>
<div class="container w-75 my-3 d-flex gap-4">
<a href="adminpanel" class="btn btn-danger">Log Out</a>
<button class="btn btn-primary" onclick="showpbox()">Add Product</button>

<button class="btn btn-info" onclick="showptable()">Show Products</button>

<button class="btn btn-warning" onclick="showctable()">Show Customers</button>

</div>
<%
if(msg!=null){
%>
<div class="container w-75">
<h3 class="text-center text-success"><%=msg%></h3>
</div>
<%	
}
%>
<div class="container sticky-md-top " id="pbox">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card mt-5 border rounded-5">
          <div class="card-body ">
          	<button type="button" class="btn-close" aria-label="Close" onclick="hidepbox()"></button>
            <h3 class="card-title text-center">Product Information</h3>
			<form action="saveproduct" method="post" enctype="multipart/form-data">
			  <div class="mb-2">
				<label class="form-label" for="name">Product Name :</label>
				<input type="text" name="pname" class="form-control" id="name" required="required">
			</div>
			<div class="mb-2">
				<label class="form-label" for="desc">Product Description :</label>
				<textarea rows="3" cols="6" name="pdesc" class="form-control" id="desc" required="required"></textarea>
			</div>
			<div class="mb-2">
				<label class="form-label" for="discount">Discount :</label>
				<input type="text" name="pdis" class="form-control" id="discount" required="required">
			</div>
			<div class="mb-2">
				<label class="form-label" for="quantity">Qauntity :</label>
				<input type="text" name="pquant" class="form-control" id="quantity" required="required">
			</div>
			<div class="mb-2">
				<label class="form-label" for="money">Product Price :</label>
				<input type="text" name="price" class="form-control" id="money" required="required">
			</div>
			<div class="mb-2">
				<label class="form-label" for="cat">Product Category :</label>
				<input type="text" name="category" class="form-control" id="cat" required="required">
			</div>
			<div class="mb-2">
				<label class="form-label" for="file">Select product Image :</label>
				<input type="file" name="pfilename" class="form-control" id="file" required="required">
				<input type="hidden" name="uname" value="<%=check%>">
			</div>
			
			<div class="mb-2 text-center">
					<button class="btn btn-success w-50">ADD Product</button>
			</div>
			</form>
		</div>
     </div>
   </div>
  </div>
</div>
<div class="container bg-light" id="ptable">
<h2 class="text-center">List Of Product</h2>
<button type="button" class="btn-close" aria-label="Close" onclick="hideptable()"></button>
<table class="table border">
<tr>
	<th>Product Name</th>
	<th>Product Discount</th>
	<th>Product Quantity</th>
	<th>Product Price</th>
	<th>Product Description</th>
	<th>Delete Product</th>
</tr>	
<%
if(pl!=null){
	for(Products p:pl){
%>
<tr>
		<td><%=p.getPname()%></td>
		<td><%=p.getPdis()%></td>
		<td><%=p.getPquant()%></td>
		<td><%=p.getPrice() %></td>
		<td><%=p.getPdesc() %></td>
	<form action="deletep" method="post">
		<input type="hidden" name="pname" value="<%=p.getPname()%>">
		<input type="hidden" name="uname" value="<%=p.getUname() %>">
		<td><button class="btn btn-outline-danger">Delete</button></td>
	</form>
</tr>
<% 		
	}
}
%>
</table>
</div>

<!-- customer table -->
<div class="container bg-light" id="ctable">
<h2 class="text-center">List Of Customers</h2>
<button type="button" class="btn-close" aria-label="Close" onclick="hidectable()"></button>
<table class="table border">
<tr>
	<th>Username</th>
	<th>Product</th>
	<th>Product Name</th>
	<th>Quantity</th>
	<th>Total Price</th>
	<th>Full Name</th>
	<th>Local Address</th>
	<th>City</th>
	<th>Pin Code</th>
	<th>Payment Mode</th>
</tr>	
<%
if(apil!=null){
	for(AddressAndProductInfo api:apil){
%>
<tr>
		<td><%=api.getUname()%></td>
		<td><img alt="" src="images/<%=api.getPimg()%>" style="height: 60px;width: 60px;"></td>
		<td><%=api.getPname()%></td>
		<td><%=api.getQuantity()%></td>
		<td><%=api.getTprice()%></td>
		<td><%=api.getFullname() %></td>
		<td><%=api.getStreet() %></td>
		<td><%=api.getCity() %></td>
		<td><%=api.getPin() %></td>
		<td><%=api.getPaymethod() %></td>
</tr>
<% 		
	}
}
%>

</table>
</div>
<script type="text/javascript">
	function showpbox(){
		var x = document.getElementById("pbox")
		x.style.display="block";
	}
	function hidepbox(){
		document.getElementById("pbox").style.display="none";
	}
	function showptable(){
		var x = document.getElementById("ptable")
		x.style.display="block";
		
	}
	function hideptable(){
		document.getElementById("ptable").style.display="none";
	}
	function showctable(){
		var x = document.getElementById("ctable")
		x.style.display="block";
	}
	function hidectable(){
		document.getElementById("ctable").style.display="none";
	}
</script>

<% 	
}else{
	response.sendRedirect("adminlogin.jsp");
}
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>