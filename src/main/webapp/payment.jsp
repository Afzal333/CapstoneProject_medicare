<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Panel</title>
        <%@include file="components/common_css_js.jsp" %>


    </head>
    <body >

        <%@include  file="components/navbar.jsp" %>
           <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>




            
              

            <!--second row-->

            <div class="row ">

                <!--second :row first col-->
                <div class="col-md-10 mt-5">


                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center ">

                            <div class="container mt-5 mt-5">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to view order details</p>
                            <h1 class="text-uppercase text-muted" style="background-color:rgb(130,216,241);">Product has been sucessfully placed</h1>

                        </div>

                    </div>
                </div>

                <!--second row : second col-->
			</div>
                

        <!--add category modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">View your order status</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h1>Product booking successful</h1>
                        <h4>OrderId=768739828</h4>
                        <h4>Product will be delivered in 3-4 days</h4>
                        <h4>Shipped with Ecom Express</h4>


                    </div>

                </div>
            </div>
        </div>




      
                    



                           





        <!--End product modal-->
         <img src="img/donation.PNG"  style="width: 100%;" class="img-fluid" alt=""> 
        
        
     <%@include  file="components/common_modals.jsp" %>


    </body>
</html>
