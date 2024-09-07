<%@page import="com.MainApp.Pojo.AddressAndProductInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITAN | ADDRESS</title>

<style>
.main-navbar{
    border-bottom: 1px solid #ccc;
}
.main-navbar .top-navbar{
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 20px;
}
.main-navbar .top-navbar .brand-name{
    color: #fff;
}
.main-navbar .top-navbar .nav-link{
    color: #fff;
    font-size: 16px;
    font-weight: 500;
}

.shopping-cart .cart-header{
    padding: 10px;
}
.shopping-cart .cart-header h4{
    font-size: 18px;
    margin-bottom: 0px;
}
.shopping-cart .cart-item a{
    text-decoration: none;
}
.shopping-cart .cart-item{
    background-color: #fff;
    box-shadow: 0 0.125rem 0.25rem rgb(0 0 0 / 8%);
    padding: 10px 10px;
    margin-top: 10px;
}
.shopping-cart .cart-item .product-name{
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    cursor: pointer;
}
.shopping-cart .cart-item .price{
    font-size: 16px;
    font-weight: 600;
    padding: 4px 2px;
}
.shopping-cart .btn1{
    border: 1px solid;
    margin-right: 3px;
    border-radius: 0px;
    font-size: 10px;
}
.shopping-cart .btn1:hover{
    background-color: #2874f0;
    color: #fff;
}
.shopping-cart .input-quantity{
    border: 1px solid #000;
    margin-right: 3px;
    font-size: 12px;
    width: 40%;
    outline: none;
    text-align: center;
}

.footer-area{
    padding: 40px 0px;
    color: #fff;
}
.footer-area a{
    text-decoration: none;
}
.footer-area .footer-heading{
    font-size: 24px;
    color: #fff;
}
.footer-area .footer-underline{
    height: 1px;
    width: 70px;
    background-color: #ddd;
    margin: 10px 0px;
}
.copyright-area{
    padding: 10px 0px;
    background-color: #262626;
}
.social-media a{
	text-decoration: none;
	color: #fff;
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
crossorigin="anonymous" referrerpolicy="no-referrer"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%
List<AddressAndProductInfo> col = (List<AddressAndProductInfo>)request.getAttribute("col");
String check = (String)request.getAttribute("check");
%>
<div class="main-navbar shadow-sm sticky-top">
        <div class="top-navbar bg-dark">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2 my-auto d-none d-sm-none d-md-block d-lg-block">
                        <h5 class="brand-name">TITAN</h5>
                    </div>
                    <div class="col-md-5 my-auto">
                        <form role="search">
                            <div class="input-group">
                                <input type="search" placeholder="Search your product" class="form-control" />
                                <button class="btn bg-white" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-5 my-auto">
                        <ul class="nav justify-content-end">      	
                          <li class="nav-item">
                                <a class="nav-link" href="#"><i class="fa fa-shopping-cart"></i>Cart</a> 
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" onclick="showorder()" href="#" aria-current="page">Orders</a>
                            </li>
                            <li class="nav-item dropdown">
                            	<a class="nav-link" href="#"><i class="fa fa-user"></i>Welcome,<%=check %></a>
                            </li>
                        </ul>
                    </div>
                </div>
           </div>
      </div>
     <nav class="navbar navbar-expand-lg">
          <div class="container-fluid">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                          <form action="uhome" method="post">
                          <input type="hidden" name="uname" value="<%=check%>">
                          <button class="nav-link">Home</button>
                          </form>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link active" href="#" aria-current="page">/ Address & Order</a>
                      </li>
                  </ul>
            </div>
      </nav> 
</div>
<div class="container">
<h1 class="text-center">Your Orders</h1>
<hr>
<%
if(col!=null){
	for(AddressAndProductInfo p:col){
%>
<div class="row bg-light shadow-lg p-2 mb-5 bg-body-tertiary">
                <div class="col-md-12">
                    <div class="shopping-cart">

                        <div class="cart-header d-none d-sm-none d-mb-block d-lg-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <img alt="" src="images/<%=p.getPimg()%>" style="height: 100px;width: 100px;">
                                    <h4><%=p.getPname() %></h4>
                                </div>
                                <div class="col-md-2">
                                    <h4><%=p.getTprice() %></h4>
                                </div>
                                <div class="col-md-2">
                                    <h4><%=p.getQuantity() %></h4>
                                </div>
                                <div class="col-md-2">
                                    <h4 class="text-success">Order Confirmed Successfully</h4>
                              </div>
                       </div>
                </div>
          </div>       
    </div>          
</div>
<%		
}}
%>
</div>
<%
ArrayList<String> l = (ArrayList<String>)request.getAttribute("l");
if(l!=null){
%>	
<div class="container mt-5 w-75 shadow bg-white p-3 mb-5">
    <h4>Checkout</h4>
       <hr>
     <div class="row">
     <div class="col-md-12 mb-4">
      <div class="shadow bg-white p-3">
          <h4 class="text-primary">
        Item Total Amount : 
         <span class="float-end">Rs.<%=l.get(3)%></span>
                        </h4>
                        <hr>
                        <small>* Items will be delivered in 3 - 5 days.</small>
                        <br/>
                        <small>* Tax and other charges are included .</small>
                    </div>
                </div>
             </div>  
<h3 class="mb-4 text-primary">Payment & Address</h3>
<form action="address" method="post">

		 <div class="col-md-6 mb-3">
		 	<label class="form-label">Payment Mode</label>
        <select class="form-select" aria-label="Default select example" name="paymethod">
		  <option value="cashOnDelivery">Cash On Delivery</option>
		  <option value="online">UPI/BHIM/Paytm</option>
		  <option value="card">Credit Card/Debit Card</option>
		</select>
    </div>
    <div class="col-md-6 mb-3">
        <label for="fullName" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="fullName" name="fullname" placeholder="Enter your full name" required="required">
    </div>

    <div class="col-md-6 mb-3">
        <label for="addressLine1" class="form-label">Landmark</label>
        <input type="text" class="form-control " id="addressLine1" name="street" placeholder="Apartment, studio, or floor" required="required">
    </div>

    <div class="col-md-2 mb-3">
        <label for="city" class="form-label">City</label>
        <input type="text" class="form-control" id="city" name="city" placeholder="City" required="required">
    </div>

        <div class="col-md-2 mb-3">
            <label for="zip" class="form-label">Pin Code</label>
            <input type="text" class="form-control" id="zip" name="pin" placeholder="Pin Code" required="required">
        </div>
        <input type="hidden"  name="uname" value="<%=l.get(0)%>">
        <input type="hidden"  name="pname" value="<%=l.get(1)%>">
        <input type="hidden"  name="pimg" value="<%=l.get(2)%>">
        <input type="hidden"  name="tprice" value="<%=l.get(3)%>">
        <input type="hidden"  name="quantity" value="<%=l.get(4)%>">
        <input type="hidden" name="adname" value="<%=l.get(5)%>">
    <button type="submit" class="btn btn-primary">Confirm Address</button>
</form>
</div>	
<%
}
%>
  
<!-- Footer Section -->

<div>
     <div class="footer-area bg-secondary">
         <div class="container">
              <div class="row">
                 <div class="col-md-3">
                        <h4 class="footer-heading">TITAN</h4>
                        <div class="footer-underline"></div>
                        <p>Explore a wide range of high-quality products from trusted brands, 
                        all available at competitive prices.
                            Whether you're looking for the latest trends or everyday essentials,
                             we've got you covered. Happy shopping!"
                        </p>
                  </div>
                    <div class="col-md-3">
                        <h4 class="footer-heading">Quick Links</h4>
                        <div class="footer-underline"></div>
                        <div class="mb-2"><a href="" class="text-white">Home</a></div>
                        <div class="mb-2"><a href="" class="text-white">About Us</a></div>

                        <div class="mb-2"><a href="" class="text-white">Contact Us</a></div>
                        <div class="mb-2"><a href="" class="text-white">Blogs</a></div>
                    </div>
                    <div class="col-md-3">
                        <h4 class="footer-heading">Shop Now</h4>
                        <div class="footer-underline"></div>
                        <div class="mb-2"><a href="" class="text-white">Collections</a></div>
                        <div class="mb-2"><a href="" class="text-white">Trending Products</a></div>
                        <div class="mb-2"><a href="" class="text-white">New Arrivals Products</a></div>
                        <div class="mb-2"><a href="" class="text-white">Featured Products</a></div>
                        <div class="mb-2"><a href="" class="text-white">Cart</a></div>
                    </div>
                    <div class="col-md-3">
                        <h4 class="footer-heading">Reach Us</h4>
                        <div class="footer-underline"></div>
                        <div class="mb-2">
                         <p><i class="fa fa-map-marker"></i> #444,A.Nagar road,VimanNagar Area,Pune,India - 560077</p>
                        </div>
                        <div class="mb-2">
                           <a href="" class="text-white"><i class="fa fa-phone"></i> +91 888-XXX-XXXX</a>
                        </div>
                        <div class="mb-2">
                            <a href="" class="text-white"><i class="fa fa-envelope"></i> titanE-commerce@gmail.com</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <p class="text-light">@ TITAN E-commerce. All rights Reserved.</p>
                    </div>
                    <div class="col-md-4">
                        <div class="social-media text-light">
                            Get Connected:
                            <a href="#"><i class="fa-brands fa-facebook"></i></a>
                            <a href="#"><i class="fa-brands fa-twitter"></i></a>
                            <a href="#"><i class="fa-brands fa-instagram"></i></a>
                            <a href="#"><i class="fa-brands fa-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>        
</body>
</html>