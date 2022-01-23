<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>

<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;

    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;

        }

    }


%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>
<title>SELECT Operation</title>
        <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
</head>
<body style="background-color: #E4F3E1;">

	<%@include file="components/navbar.jsp"%>

	<div class="container admin">


		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp"%>
		</div>




		<div class="row mt-3">

			<!--first col-->
			<div class="col-md-4">

				<!--first box-->
				<div class="card" data-toggle="modal" data-target="#add-user-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/seo-and-web.png" alt="user_icon">

						</div>
						<h1>2564</h1>
						<h1 class="text-uppercase text-muted">Users</h1>

					</div>

				</div>



			</div>

			<!--second col-->

			<div class="col-md-4">


				<div class="card text-center">

					<div class="card-body" data-toggle="modal"
						data-target="#view-category-modal">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/list.png" alt="user_icon">

						</div>

						<h1>07</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>

					</div>

				</div>


			</div>


			<!--third col-->
			<div class="col-md-4">


				<div class="card" data-toggle="modal"
						data-target="#view-product-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/product.png" alt="user_icon">

						</div>

						<h1>30</h1>
						<h1 class="text-uppercase text-muted">Products</h1>

					</div>

				</div>


			</div>





		</div>

		<!--second row-->

		<div class="row mt-3">

			<!--second :row first col-->
			<div class="col-md-6">


				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/keys.png" alt="user_icon">

						</div>

						<p class="mt-2">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>

					</div>

				</div>
			</div>

			<!--second row : second col-->

			<div class="col-md-6">

				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/plus.png" alt="user_icon">

						</div>

						<p class="mt-2">Click here to add new Product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>

					</div>

				</div>

			</div>




		</div>



	</div>



	<!--add category modal-->



	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">


						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />

						</div>


						<div class="form-group">
							<textarea style="height: 300px;" class="form-control"
								placeholder="Enter category description" name="catDescription"
								required></textarea>

						</div>

						<div class="cotnainer text-center">

							<button class="btn btn-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>



					</form>




				</div>

			</div>
		</div>
	</div>




	<!--End add category modal-->

	<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

	<!--product modal-->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Product details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!--form-->

					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addproduct" />

						<!--product title-->

						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter title of product" name="pName" required />
						</div>

						<!--product description-->

						<div class="form-group">
							<textarea style="height: 150px;" class="form-control"
								placeholder="Enter product description" name="pDesc"></textarea>

						</div>

						<!--product price-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter price of product" name="pPrice" required />
						</div>

						<!--product discount-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product discount" name="pDiscount" required />
						</div>


						<!--product quantity-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter product Quantity" name="pQuantity" required />
						</div>


						<!--product category-->

						<%
						CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
						List<Category> list = cdao.getCategories();
						%>


						<div class="form-group">
							<select name="catId" class="form-control"
								placeholder="Select Category" id="">
								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>">
									<%=c.getCategoryTitle()%>
								</option>
								<%}%>
							</select>

						</div>



						<!--product file-->

						<div class="form-group">
							<label for="pPic">Select Picture of product</label> <br> <input
								type="file" id="pPic" name="pPic" required />

						</div>


						<!--submit button-->
						<div class="container text-center">

							<button class="btn btn-outline-success">Add product</button>

						</div>



					</form>
					<!--end form-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>





	<!--End product modal-->

	<!--add user modal-->



	<!-- Modal -->
	<div class="modal fade" id="add-user-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">User List</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost:3306/mycart" user="root"
					password="root" />

				<sql:query var="user" dataSource="${myDS}">
                SELECT * FROM user;
    			</sql:query>
				<div>
					<table cellpadding="10">
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>EmailId</th>
							<th>Contact Number</th>
						</tr>
						<c:forEach var="user" items="${user.rows}">
							<tr>
								<td>${user.user_id}</td>
								<td>${user.user_name}</td>
								<td>${user.user_email}</td>
								<td>${user.user_phone}</td>
							</tr>
						</c:forEach>
					</table>
				</div>


				<div class="cotnainer text-center">


					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>




				</form>




			</div>

		</div>
	</div>
	</div>




	<!--End add user modal-->

	<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->


	<!--view category modal-->



	<!-- Modal -->
	<div class="modal fade" id="view-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost:3306/mycart" user="root"
						password="root" />

					<sql:query var="category" dataSource="${myDS}">
                SELECT * FROM category;
                </sql:query>
				</div>
				<div>
					<table cellpadding="10">
						<tr>
							<th>Id</th>
							<th>Title</th>
							<th>Description</th>
						</tr>
						<c:forEach var="category" items="${category.rows}">
							<tr>
								<td>${category.categoryId}</td>
								<td>${category.categoryTitle}</td>
								<td>${category.categoryDescription}</td>
								<td><a href="update.jsp?id=<c:out value="${category.categoryId}"/>">Update</a></td>
								<td><a href="javascript:confirmGo('Sure to delete this record?','deletedb.jsp?id=<c:out value="${category.categoryId}"/>')">Delete</a></td>

							</tr>
						</c:forEach>
					</table>
				</div>


				<div class="cotnainer text-center">


					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>


				</div>
			</div>
		</div>
	</div>




	<!--End view-category-modal-->

	<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
	
	<!-- Modal -->
	<div class="modal fade" id="view-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost:3306/mycart" user="root"
						password="root" />

					<sql:query var="product" dataSource="${myDS}">
                SELECT * FROM product;
                </sql:query>
				</div>
				<div>
					<table cellpadding="10">
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Price</th>
							<th>Discount</th>
							<th>Quantity</th>
							
						</tr>
						<c:forEach var="product" items="${product.rows}">
							<tr>
								<td>${product.pId}</td>
								<td>${product.pName}</td>
								<td>${product.pPrice}</td>
								<td>${product.pDiscount}</td>
								<td>${product.pQuantity}</td>								
								<td><a href="pupdate.jsp?id=<c:out value="${product.pId}"/>">Update</a></td>
								<td><a href="javascript:confirmGo('Sure to delete this record?','pdeletedb.jsp?id=<c:out value="${product.pId}"/>')">Delete</a></td>

							</tr>
						</c:forEach>
					</table>
				</div>


				<div class="cotnainer text-center">


					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>


				</div>
			</div>
		</div>
	</div>




	<!--End view-category-modal-->

	<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->


	<%@include file="components/common_modals.jsp"%>

</body>
</html>
