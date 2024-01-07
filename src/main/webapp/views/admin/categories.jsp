<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: This MC
  Date: 26/12/2023
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Categories</title>

</head>
<body>
<form action="<%=request.getContextPath()%>/categoriesController/findCategories?page=1" method="get">
    <label for="name">Catalog Name</label>
    <input type="text" id="name" name="name" value="${catalogName}" placeholder="Input Catalog Name"/>
    <input type="submit" value="Search"/>

<select id="sortBy" name="sortBy" onchange="changeSortBy()">
    <option value="id" ${sortBy.equals("id")?'selected':''}>Catalog Id</option>
    <option value="name" ${sortBy.equals("name")?'selected':''}>Catalog Name</option>
<%--    <option value="price" ${sortBy.equals("price")?'selected':''}>Price</option>--%>
</select>
<select id="direction" name="direction" onchange="changeDirection()">
    <option value="ASC" ${direction.equals("ASC")?'selected':''}>Ascending</option>
    <option value="DESC" ${direction.equals("DESC")?'selected':''}>Descending</option>
</select>
</form>

<table border="1">
    <thead>
    <tr>
        <th>Categories Id</th>
        <th>Categories Name</th>
        <th>Description</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listCategories}" var="categories">
        <tr>
            <td>${categories.id}</td>
            <td>${categories.name}</td>
            <td>${categories.descriptions}</td>
            <td>${categories.status?"Active":"Inactive"}</td>
            <td>
                <a href="<%=request.getContextPath()%>/categoriesController/initUpdate?catalogId=${categories.id}">Update</a>
                <a href="<%=request.getContextPath()%>/categoriesController/delete?catalogId=${categories.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--<c:forEach items="${totalPage}" var="page">--%>
<%--    <a href="<%=request.getContextPath()%>/categoriesController/findCategories?page=${page}">${page}</a>--%>
<%--</c:forEach>--%>
<a href="<%=request.getContextPath()%>/views/admin/newCategories.jsp">Create New Categories</a><br>
<a href="<%=request.getContextPath()%>/views/admin/dashboard.jsp">Back</a>
</body>
</html>