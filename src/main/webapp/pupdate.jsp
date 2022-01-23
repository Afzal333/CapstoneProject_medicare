<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>
    </head>
    <body style="background-color: #E4F3E1;">
    <%@include file="components/navbar.jsp"%>
 
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/mycart"
                           user="root"  password="root"/>
 
        <sql:query dataSource="${dbsource}" var="product">
            SELECT * from product where pId=?;
            <sql:param value="${param.id}" />
        </sql:query>
        <form action="pupdatedb.jsp" method="post">
            <table border="0" width="40%" >
                <caption>Update Product</caption>
                <tr>                    
					<th>Name</th>
					<th>Price</th>
					<th>Discount</th>
					<th>Quantity</th>
                </tr>
                <c:forEach var="product" items="${product.rows}">
                    <tr>
                        <td><input type="hidden" value="${param.id}" name="id"/>
                            <input type="text" value="${product.pName}" name="pName"/></td>
                        <td><input type="text" value="${product.pPrice}" name="pPrice"/></td>
                        <td><input type="text" value="${product.pDiscount}" name="pDiscount"/></td>
                        <td><input type="text" value="${product.pQuantity}" name="pQuantity"/></td>
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="index.jsp">Go Home</a>
        </form>
    </body>
</html>