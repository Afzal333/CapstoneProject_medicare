

<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart - Home </title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
       <script src="https://kit.fontawesome.com/7aea243c20.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
    crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <body style="background-color: #dbd4d3 ;">

        <%@include  file="components/navbar.jsp" %>
         <img src="img/add.png"  style="width: 100%;" class="img-fluid" alt=""> 

        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <% String cat = request.getParameter("category");
                    //out.println(cat);

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();

                    } else {

                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);

                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();

                %>



                <!--show categories-->
                <div class="col-md-2">


                    <div class="list-group mt-4">

                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>




                        <% for (Category c : clist) {
                        %>



                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>


                        <%    }
                        %>



                    </div>


                </div>

                <!--show products-->
                <div class="col-md-10">


                    <!--row-->
                    <div class="row mt-4">

                        <!--col:12-->
                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--traversing products-->

                                <%
                                    for (Product p : list) {

                                %>


                                <!--product card-->
                                <div class="card product-card">

                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 120px;max-width: 90%;width: auto; " class="card-img-top m-2" alt="...">

                                    </div>

                                    <div class="card-body">

                                        <h5 class="card-title"><%= p.getpName()%></h5>

                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc())%>

                                        </p>

                                    </div>

                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                                        <button class="btn  btn-outline-success ">  &#8377; <%= p.getPriceAfterApplyingDiscount()%>/-  <span class="text-secondary discount-label">  &#8377; <%= p.getpPrice()%> , <%= p.getpDiscount()%>% off </span>  </button>

                                    </div>



                                </div>






                                <%}

                                    if (list.size() == 0) {
                                        out.println("<h3>No item in this category</h3>");
                                    }


                                %>


                            </div>                     



                        </div>                   

                    </div>



                </div>

            </div>
        </div>
	<%@include  file="components/common_modals.jsp" %>
	<img src="img/covid.PNG"  style="width: 100%;" class="img-fluid" alt="">
<!-- 	<section class="news py-5">
	<div class="container py-5">
	<div class="col-lg-10 m-auto text-center">
	<h1>Join our community</h1>
	<input type="text" class="px-3"placeholder="Enter your mail">
	<button class="btn2">Submit</button>
	</div>
	</div>
	</section>-->
	<section > 
<div class="row py-5">
    <div class="col">
        <div class="row py-10">
            <div class="container">
                <h5>COMPANY</h5>
               
                <P>About </P>
                <p>Product</p>
                <p>Payment-Service</p>
                <p>Trusted Courier Service</p>
       
            </div>
            <div class="col-lg-3">
            <div class="container">
                <h5>STAY CONNECTED</h5>
                <SPAN><i class="fab fa-instagram" onClick="instagram()"></i> </SPAN>
                <span><i class="fab fa-linkedin" onClick="linkedin()"></i></span>
                <span><i class="fab fa-google" onClick="google()"></i> </span>
               </div>
               </div>
        </div>

    </div>
</div>
<hr>
<p class="text-center">Copyright &#169 2021 All rights reserved by Medicare.com</p>


</section>
    </body>
</html>
