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
 
        <sql:query dataSource="${dbsource}" var="category">
            SELECT * from category where categoryId=?;
            <sql:param value="${param.id}" />
        </sql:query>
        <form action="updatedb.jsp" method="post">
            <table border="0" width="40%" >
                <caption>Update Category</caption>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                </tr>
                <c:forEach var="category" items="${category.rows}">
                    <tr>
                        <td><input type="hidden" value="${param.id}" name="id"/>
                            <input type="text" value="${category.categoryTitle}" name="categoryTitle"/></td>
                        <td><input type="text" value="${category.categoryDescription}" name="categoryDescription"/></td>
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="index.jsp">Go Home</a>
        </form>
    </body>
</html>