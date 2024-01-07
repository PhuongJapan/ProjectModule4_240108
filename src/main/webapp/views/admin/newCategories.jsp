<%--
  Created by IntelliJ IDEA.
  User: saton
  Date: 2024/01/01
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Category</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/categoriesController/create" method="post" enctype="multipart/form-data" modelMap="cateNew">
<%--    <label for="id">Categories Id</label>--%>
<%--    <input type="number" id="id" name="id"/><br>--%>
    <label for="name">Categories Name</label>
    <input type="text" id="name" name="name"/><br>
    <label for="descriptions">Description</label>
    <input type="text" id="descriptions" name="descriptions"/><br>
    <label for="active">Status</label>
    <input type="radio" id="active" name="status" value="true" checked/><label for="active">Active</label>
    <input type="radio" id="inactive" name="status" value="false"/><label for="inactive">Inactive</label><br>
    <input type="submit" value="Create"/>
</form>
</body>
</html>
