<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITAN | LOGIN</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="text-center bg-dark">
<img alt="logo" src="images/logo.png" style="height:100px ">
</div>
<div class="container w-50 my-2">
<%
String msg = (String)request.getAttribute("amsg");
if(msg!=null){
%>
<p class="text-success text-center"><%=msg%></p>
<% 	
}
%>
<%
String msg1 = (String)request.getAttribute("amsg1");
if(msg1!=null){
%>
<p class="text-danger text-center"><%=msg1%></p>
<% 	
}
%>
</div>
<div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card mt-5">
          <div class="card-body">
            <h3 class="card-title text-center">Admin's Login</h3>
            <hr>
            <form action="adminlogin" method="post">
            	<div class="mb-3">
                <label for="uname" class="form-label">Username</label>
                <input type="text" class="form-control" id="uname" name="uname" placeholder="Create your username" required="required">
              </div>	
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="upass" placeholder="Create password" required="required">
              </div>
              <button type="submit" class="btn btn-success w-100">LogIn</button>
            </form>
            <br>
            <hr>
            <div class="text-center">
            <a href="adminsignup.jsp" class="btn btn-outline-primary w-50">Sign Up</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
