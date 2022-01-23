
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");

%>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&display=swap" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark  custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">MEDICARE</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>


                <li class="nav-item dropdown">
                    <a class="nav-link " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Covid-19 Essentials</a>
                        <a class="dropdown-item" href="#">Covid-19 Instruments</a>
                         <a class="dropdown-item" href="#">Immunity Boosters</a>
                          <a class="dropdown-item" href="#">Syrups</a>
                           <a class="dropdown-item" href="#">Antibiotics</a>
                           <a class="dropdown-item" href="#">Paracetamol</a>
                        <div class="dropdown-divider"></div>
      
                    </div>
                </li>
			<a class="nav-link" href="about.jsp">About </a> 
            </ul>
            
           <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-success" type="submit">Search</button>
    </form>
            <ul class="navbar-nav ml-auto">


                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart">  <i class="fa fa-cart-plus"  style="font-size: 20px;"></i> <span class="ml-0 cart-items">( 0 )</span>  </a>
                </li>



                <%                    if (user1 == null) {

                %>

                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login </a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register </a>
                </li>


                <%                        } else {


                %>
                <li class="nav-item active">
                    <a class="nav-link" href="<%=  user1.getUserType().equals("admin") ? "admin.jsp" : "index.jsp"%>"><%= user1.getUserName()%> </a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout </a>
                </li>



                <%    }

                %>




            </ul>

        </div>

    </div>
</nav>