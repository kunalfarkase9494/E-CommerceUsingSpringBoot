<%@page import="com.MainApp.Pojo.Products"%>
<%@page import="com.MainApp.Pojo.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITAN | INFO</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
crossorigin="anonymous" referrerpolicy="no-referrer"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

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
    padding: 14px 0px;
    background-color: #262626;
}
.social-media a{
	text-decoration: none;
	color: #fff;
}
#showcart{
	display: none;
}

</style>
</head>
<body>
<!--NavBar -->
<% 
String check = (String)request.getAttribute("check");
List<Cart> cl = (List<Cart>)request.getAttribute("cl");
Products p = (Products)request.getAttribute("product");

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
                        	<%
                            	if(check!=null){
                            %>
                            <button class="nav-link" onclick="showcart()" ><i class="fa fa-shopping-cart"></i>Cart</button>	
                            <%		
                            	}else{
                            %>
                            	<a class="nav-link" onclick="showmsg()" href="#"><i class="fa fa-shopping-cart"></i>Cart</a>
                            <%		
                            	}
                            %>  
                            <li class="nav-item">
                                
                            </li>
                            <li class="nav-item">
                            <% if(check!=null){
                            %>
                           	<form action="vieworders" method="post">
                           	<input type="hidden" name="uname" value="<%=check%>">
                           	<button class="nav-link">Orders</button>
                           	</form>		
                            <%
                            }else{
                            %>
                            	<a class="nav-link" href="#" onclick="showmsg()" >Orders</a>
                            <%	
                            }
                            %>
                                
                            </li>
                            <li class="nav-item dropdown">
                            <%
                            	if(check!=null){
                            %>
                            	<a class="nav-link" href="#"><i class="fa fa-user"></i>Welcome,<%=check %></a>
                            <%		
                            	}else{
                            %>
                            <a class="nav-link" href="userlogin.jsp"><i class="fa fa-user"></i> User,Login</a>
                            <%		
                            	}
                            %>   
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
                          <a class="nav-link active" href="#">/ Product Information</a>
                      </li>
                  </ul>
             	<ul class="navbar-nav my-auto">
             		<%if(check!=null){
             		%>
             		<li class="nav-item">
             			<a class="nav-link" href="/">Logout</a>
             		</li>
             		<%} %>
             	</ul>	
            </div>
      </nav> 
</div>

<!-- show cart items -->
<div class="py-3 py-md-5 bg-secondary" id="showcart">
<h3 class="text-center text-light">Cart Products</h3>
        <div class="container">
        <button class="btn-primary btn-close" onclick="closecart()"></button>
            <div class="row">
                <div class="col-md-12">
                    <div class="shopping-cart">

                        <div class="cart-header d-none d-sm-none d-mb-block d-lg-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Products</h4>
                                </div>
                                <div class="col-md-2">
                                    <h4>Price</h4>
                                </div>
                                <div class="col-md-2">
                                    <h4>Quantity</h4>
                                </div>
                                <div class="col-md-2">
                                    <h4>Remove / Order</h4>
                                </div>
                            </div>
                            </div>
                            <%
                            if(cl!=null){
                            	for(Cart c :cl){
                            
                            %>
                            <div class="cart-item">
                            <div class="row">
                                <div class="col-md-6 my-auto">
                                    <a href="">
                                        <label class="product-name">
                                            <img src="images/<%=c.getFname() %>" style="width: 100px; height: 100px" alt="">
                                            <%=c.getPname() %>
                                        </label>
                                    </a>
                                </div>
                                <div class="col-md-2 my-auto">
                                    <label class="price"><%=c.getPrice() %></label>
                                </div>
                                <div class="col-md-2 col-7 my-auto">
                                    <div class="quantity">
                                        <div class="input-group">
                                       <form action="order" method="post">
											  <div class="counter-container">
										  <span class="btn btn1 decrement"><i class="fa fa-minus"></i></span>
										  <input class="numberInput input-quantity" type="number" value="<%=1%>" readonly name="quantity" >
										 <span class="btn btn1 increment"><i class="fa fa-plus"></i></span>
										</div>
									<input type="hidden" name="price" value="<%=c.getPrice()%>">
									<input type="hidden" name="pfile" value="<%=c.getFname()%>">
									<input type="hidden" name="pname" value="<%=c.getPname()%>">
									<input type="hidden" name="adname" value="<%=c.getAdname()%>">
                                    <input type="hidden" name="uname" value="<%=check%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-5 my-auto">
                                    <div class="remove">
                                        <button class="btn btn-warning btn-sm">Buy this Now</button>
                                     </form>
                                    </div>
                                    <div class="remove">
                                    <form action="deletecartp">
                                    <input type="hidden" name="cid" value="<%=c.getCid()%>">
                                    <input type="hidden" name="uname" value="<%=check%>">
                                        <button class="btn btn-danger btn-sm mt-3">
                                            <i class="fa fa-trash"></i> Remove
                                        </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                            
                            <%		
                            	}
                            }
                            %>
                            
                     </div>
                </div>
            </div>

        </div>
    </div>
    
<!-- Main Section -->
<%

if(p!=null){
%>
<div class="container w-75 my-5 shadow-lg p-2 mb-5 bg-body-tertiary rounded">
  <div class="row">
    <div class="col-md-6">
    <img src="images/<%=p.getPfile()%>" class="img-fluid img-thumbnail" alt="<%=p.getPname()%>">
    </div>
    <div class="col-md-6">
    <h3><%=p.getPname() %></h3>
    <h4>Rs.<%=p.getPrice() %></h4>
    <p>Discount:-<%=p.getPdis()%>%</p>
    <h5>Description:-</h5><p><%=p.getPdesc()%></p>
    
    <%
    if(check!=null){
    %>	
    	<form action="order" method="post">
    	<label class="label-form">Quantity :-</label>
    	<div class="counter-container">
			<span class="btn btn1 decrement"><i class="fa fa-minus"></i></span>
			<input class="numberInput input-quantity" type="number" value="<%=1%>" readonly name="quantity" >
			<span class="btn btn1 increment"><i class="fa fa-plus"></i></span>
		</div>
    	<input type="hidden" name="price" value="<%=p.getPrice()%>">
    	<input type="hidden" name="pfile" value="<%=p.getPfile()%>">
    	<input type="hidden" name="pname" value="<%=p.getPname()%>">
    	<input type="hidden" name="adname" value="<%=p.getUname()%>">
            <input type="hidden" name="uname" value="<%=check%>">
       	 <button class="btn btn-warning">Buy Now</button>
          </form>
    <%
    }else{
    %>
    <a href="#" class="btn btn-primary" onclick="showmsg()" >Buy Now</a>
    <%
    }
    %>
      
      
  </div>
</div>
</div>
<%} 
%>

<!-- Footer Session -->
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
                            <a href=""><i class="fa-brands fa-facebook"></i></a>
                            <a href=""><i class="fa-brands fa-twitter"></i></a>
                            <a href=""><i class="fa-brands fa-instagram"></i></a>
                            <a href=""><i class="fa-brands fa-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

function showmsg()
{
	alert("please login");
}
function showcart(){
	document.getElementById("showcart").style.display = "block";
}
function closecart(){
	document.getElementById("showcart").style.display = "none";
}

document.addEventListener('DOMContentLoaded', () => {

	  document.querySelectorAll('.counter-container').forEach(container => {
	    const inputField = container.querySelector('.numberInput');
	    const incrementButton = container.querySelector('.increment');
	    const decrementButton = container.querySelector('.decrement');

	    incrementButton.addEventListener('click', () => {
	      let currentValue = parseInt(inputField.value);
	      inputField.value = currentValue + 1;
	    });

	    decrementButton.addEventListener('click', () => {
	      let currentValue = parseInt(inputField.value);
	      if (currentValue > 1) {
	        inputField.value = currentValue - 1;
	      }
	    });
	  });

	});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>