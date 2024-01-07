<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: saton
  Date: 2024/01/06
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboad</title>
    <link rel="stylesheet" href="/assets/css/dashboard.css">
    <link rel="stylesheet" href="/assets/css/products.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

    <title>LIST PRODUCTS</title>
</head>
<body>
<a href="<%=request.getContextPath()%>/admin/productManagement.jsp"></a>


<div class="sidebar">
    <div class="logo-details">
        <i class='bx bxl-c-plus-plus'></i>
        <span class="logo_name">Fruits Shop YOYO</span>
    </div>
    <ul class="nav-links">
        <li>
            <a href="" class="active">
                <i class='bx bx-grid-alt'></i>
                <span class="links_name">Dashboad</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/categoriesController/findAll">
                <i  class='bx bx-box'></i>
                <span class="links_name">Categories</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/productController/findAll">
                <i  class='bx bx-box'></i>
                <span class="links_name">Products</span>
            </a>
        </li>
        <li>
            <a href="">
                <i  class='bx bx-list-ul'></i>
                <span class="links_name">Bills</span>
            </a>
        </li>
        <li>
            <a href="">
                <i  class='bx bx-pie-chart-alt-2'></i>
                <span class="links_name">Bill Details</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/userController/findAll">
                <i  class='bx bx-coin-stack'></i>
                <span class="links_name">Users</span>
            </a>
        </li>
        <li>
            <a href="">
                <i  class='bx bx-cog'></i>
                <span class="links_name">Setting</span>
            </a>
        </li>
        <li>
            <a href="">
                <i  class='bx bx-log-out'></i>
                <span class="links_name">Log out</span>
            </a>
        </li>
    </ul>
</div>
<section class="home-section">
    <nav>
        <div class="sidebar-button">
            <i class='bx bx-menu sidebarBtn'></i>
            <span class="dashboard">Dashboard</span>
        </div>
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
<%--        <div class="search-box">--%>
<%--            <input type="text" placeholder="Search...">--%>
<%--            <i class='bx bx-search' ></i>--%>
<%--        </div>--%>
        <div class="profile-details">
            <!--<img src="images/profile.jpg" alt="">-->
            <span class="admin_name">Vuong Phuong</span>
            <i class='bx bx-chevron-down' ></i>
        </div>


    </nav>


    <div class="container">
        <div class="table-wrap">
            <table class="table table-borderless">
                <thead>
                <tr>
                <th>Product ID</th>
                <th>Image</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Catalog Name</th>
                <th>Status</th>
                <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listProducts}" var="product">
                    <tr class="align-middle alert border-bottom" role="alert">
                        <td>
                            <div class="fw-600">${product.id}</div>
                        </td>
                        <td class="text-center">
<%--                            <img class="pic"--%>
<%--                                 src="https://www.freepnglogos.com/uploads/shoes-png/dance-shoes-png-transparent-dance-shoes-images-5.png"--%>
<%--                                 alt="">--%>
                            <c:forEach items="${product.listImages}" var="image">
                                <img src="${image.imageLink}" alt="${product.name}" height="50" width="50"/>
                            </c:forEach>
                        </td>
                        <td>
                                <p class="fw-600">${product.name}</p>
                        </td>
                        <td>
                            <div class="fw-600">${product.price}</div>
                        </td>
                        <td>
                            <div class="fw-600">${product.description}</div>
                        </td>
                        <td>
                            <div class="fw-600">${product.quantity}</div>
<%--                            <input class="input" type="text" placeholder="2">--%>
                        </td>
                        <td>
                            <div class="fw-600">${product.catalog.name}</div>
                        </td>
                        <td>
                            <div class="fw-600">${product.status?"Active":"Inactive"}</div>
                        </td>
                        <td>
                            <a href="<%=request.getContextPath()%>/productController/initUpdate?productId=${product.id}">Update</a>
                            <a href="<%=request.getContextPath()%>/productController/delete?productId=${product.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <a href="<%=request.getContextPath()%>/productController/initCreate">Create New Product</a>
            <a href="<%=request.getContextPath()%>/views/admin/newProduct.jsp"></a>
            <a href="<%=request.getContextPath()%>/views/admin/dashboard.jsp">Back</a>
        </div>
    </div>
</section>

</body>
</html>
