<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Create New Product</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/productController/create" method="post" enctype="multipart/form-data" modelMap="productNew">
    <label for="id">Product Id</label>
    <input type="text" id="id" name="id"/><br>
    <label for="name">Product Name</label>
    <input type="text" id="name" name="name"/><br>
    <label for="price">Price</label>
    <input type="number" id="price" name="price"/><br>
    <label for="quantity">Quantity</label>
    <input type="text" id="quantity" name="quantity"/><br>
    <label for="description">Description</label>
    <input type="text" id="description" name="description"/><br>
    <label for="avatar">Avatar</label>
    <%--Lưu ý tên khác thuộc tính name avatar vì đường link khác ảnh--%>
    <input type="file" id="avatar" name="avatar"/><br>
    <label for="otherImages">Other Images</label>
    <input type="file" id="otherImages" name="otherImages" multiple/><br>
    <label for="catalog">Choose Catalog</label>
    <select id="catalog" name="catalog.id">
        <c:forEach items="${listCategoriesCreate}" var="catalog">
            <option value="${catalog.id}">${catalog.name}</option>
        </c:forEach>
    </select><br>
    <label for="active">Status</label>
    <input type="radio" id="active" name="status" value="true" checked/><label for="active">Active</label>
    <input type="radio" id="inactive" name="status" value="false"/><label for="inactive">Inactive</label><br>
    <input type="submit" value="Create"/>
</form>
</body>
</html>
