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
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<a href="<%=request.getContextPath()%>/admin/dashboard.jsp"></a>

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
        <div class="search-box">
            <input type="text" placeholder="Search...">
            <i class='bx bx-search' ></i>
        </div>
        <div class="profile-details">
            <!--<img src="images/profile.jpg" alt="">-->
            <span class="admin_name">Vuong Phuong</span>
            <i class='bx bx-chevron-down' ></i>
        </div>
    </nav>

    <div class="home-content">
        <div class="overview-boxes">
            <div class="box">
                <div class="right-side">
                    <a href="<%=request.getContextPath()%>/countController/countData">
                    <ul>
                        <li>Total user: ${userActive+userInactive}</li>
                        <li>Total User Active : ${userActive}</li>
                        <li>Total User Inactive : ${userInactive}</li>
                    </ul>
                    </a>
                </div>
                <i class='bx bx-cart-alt cart'></i>
            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Products</div>
                    <div class="number">30</div>
                    <div class="indicator">
                        <i class='bx bx-up-arrow-alt'></i>
                        <span class="text">Up from yesterday</span>
                    </div>
                </div>
                <i class='bx bxs-cart-add cart two' ></i>
            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Orders</div>
                    <div class="number">10</div>
                    <div class="indicator">
                        <i class='bx bx-down-arrow-alt down'></i>
                        <span class="text">Down From Today</span>
                    </div>
                </div>
                <i class='bx bxs-cart-download cart four' ></i>
            </div>

            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Profit</div>
                    <div class="number">$12,876</div>
                    <div class="indicator">
                        <i class='bx bx-up-arrow-alt'></i>
                        <span class="text">Up from yesterday</span>
                    </div>
                </div>
                <i class='bx bx-cart cart three' ></i>
            </div>

        </div>

<%--        <div class="sales-boxes">--%>
<%--            <div class="recent-sales box">--%>
<%--                <div class="title">Recent Sales</div>--%>
<%--                <div class="sales-details">--%>
<%--                    <ul class="details">--%>
<%--                        <li class="topic">Date</li>--%>
    </div>
</section>
</body>
</html>
