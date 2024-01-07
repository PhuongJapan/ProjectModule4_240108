<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: This MC
  Date: 14/12/2023
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <title>Login</title>--%>
    <%--Link bootstrap Css --%>
    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>

    <link rel="stylesheet" href="/assets/login.css"/>
</head>
<body>

<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Sign In</h3>
                <div class="d-flex justify-content-end social_icon">
                    <span><i class="fab fa-facebook-square"></i></span>
                    <span><i class="fab fa-google-plus-square"></i></span>
                    <span><i class="fab fa-twitter-square"></i></span>
                </div>
            </div>
            <div class="card-body">
                <form  action="<%=request.getContextPath()%>/userController/login" method="post" modelMap="loginRequest">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="email" id="email" name="email" class="form-control" placeholder="email address">

                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" id="password" name="password" class="form-control" placeholder="password">
                    </div>
                        <c:if test="${not empty error}">
                            <label style="color: red">${error}</label><br>
                        </c:if>
                    <div class="row align-items-center remember">
                        <input type="checkbox">Remember Me
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Login" class="btn float-right login_btn">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center links">
                    Don't have an account?<a href="#">Sign Up</a>
                </div>
                <div class="d-flex justify-content-center">
                    <a href="#">Forgot your password?</a>
                </div>
            </div>
        </div>
    </div>
</div>


<%--<form action="<%=request.getContextPath()%>/userController/login" method="post" modelMap="loginRequest">--%>
<%--    <label for="email">Email</label>--%>
<%--    <input type="text" id="email" name="email"/><br>--%>
<%--    <label for="password">Password</label>--%>
<%--    <input type="password" id="password" name="password"/><br>--%>
<%--    <c:if test="${not empty error}">--%>
<%--        <label style="color: red">${error}</label><br>--%>
<%--    </c:if>--%>
<%--    <input type="submit" value="Login"/>--%>
<%--</form>--%>
</body>
</html>