<%--
  Created by IntelliJ IDEA.
  User: saton
  Date: 2024/01/07
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/categoriesController/update" method="post">
    <label for="id">Catalog Id</label>
    <input type="number" id="id" name="id" value="${updateCategories.id}" readonly/><br>
    <label for="name">Catalog Name</label>
    <input type="text" id="name" name="name" value="${updateCategories.name}"/><br>
    <label for="descriptions">Description</label>
    <input type="text" id="descriptions" name="descriptions" value="${updateCategories.descriptions}"/><br>
    <label for="active">Status</label>
    <input type="radio" id="active" name="status" value="true" ${updateCategories.status?"checked":""}/><label for="active">Active</label>
    <input type="radio" id="inactive" name="status" value="false"  ${updateCategories.status?"":"checked"}/><label for="inactive">Inactive</label><br>
    <input type="submit" value="Update"/>
</form>

</body>
</html>
